import GObject from 'gi://GObject';
import Meta from 'gi://Meta';
import Shell from 'gi://Shell';

import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import { Extension } from 'resource:///org/gnome/shell/extensions/extension.js';

const WorkspaceSwitcher = GObject.registerClass(
    class WorkspaceSwitcher extends GObject.Object {
        _init(ext) {
            super._init();
            this._ext = ext;
            // `current` is the active workspace index, `previous` is the one
            // we came from before the current.
            this._current = null;
            this._previous = null;

            this._workspaceManager = global.workspace_manager;
            this._windowAddedId = 0;
            this._workspaceSwitchedId = 0;
        }

        enable() {
            const settings = this._ext.getSettings();
            this._settings = settings;

            // Seed initial state.
            this._current = this._workspaceManager.get_active_workspace_index();
            this._previous = this._current;

            this._workspaceSwitchedId =
                this._workspaceManager.connect('workspace-switched',
                    (_wm, from, to) => {
                        if (this._current === to)
                            return;
                        this._previous = this._current;
                        this._current = to;
                    });

            this._keybindingId =
                Main.wm.addKeybinding(
                    'switch-to-previous-workspace',
                    settings,
                    Meta.KeyBindingFlags.NONE,
                    Shell.ActionMode.NORMAL,
                    () => this._switchToPrevious());
        }

        disable() {
            if (this._keybindingId) {
                Main.wm.removeKeybinding('switch-to-previous-workspace');
                this._keybindingId = 0;
            }
            if (this._workspaceSwitchedId) {
                this._workspaceManager.disconnect(this._workspaceSwitchedId);
                this._workspaceSwitchedId = 0;
            }
            this._settings = null;
            this._previous = null;
            this._current = null;
        }

        _switchToPrevious() {
            const n = this._workspaceManager.get_n_workspaces();
            if (n < 2)
                return;

            // If we never saw a switch (e.g. freshly enabled), no-op gracefully.
            if (this._previous === null || this._previous === this._current)
                return;

            const target = this._workspaceManager.get_workspace_by_index(this._previous);
            if (target)
                target.activate(global.get_current_time());
        }
    });

export default class WorkspacePreviousExtension extends Extension {
    enable() {
        this._switcher = new WorkspaceSwitcher(this);
        this._switcher.enable();
    }

    disable() {
        if (this._switcher) {
            this._switcher.disable();
            this._switcher = null;
        }
    }
}
