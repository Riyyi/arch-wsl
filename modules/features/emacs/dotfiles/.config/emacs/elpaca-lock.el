((ace-window :source "elpaca-menu-lock-file" :recipe
			 (:package "ace-window" :repo "abo-abo/ace-window" :fetcher github
					   :files
					   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						"docs/*.texinfo"
						(:exclude ".dir-locals.el" "test.el" "tests.el"
								  "*-test.el" "*-tests.el" "LICENSE" "README*"
								  "*-pkg.el"))
					   :source "MELPA" :id ace-window :type git :protocol https
					   :inherit t :depth treeless :ref
					   "77115afc1b0b9f633084cf7479c767988106c196"))
 (alert :source "elpaca-menu-lock-file" :recipe
		(:package "alert" :fetcher github :repo "jwiegley/alert" :files
				  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
				   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
				   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
				   "docs/*.texinfo"
				   (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							 "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				  :source "MELPA" :id alert :type git :protocol https :inherit t
				  :depth treeless :ref
				  "31fc56855289d0846e73d7ca9b84b628aeac16a0"))
 (all-the-icons :source "elpaca-menu-lock-file" :recipe
				(:package "all-the-icons" :repo "domtronn/all-the-icons.el"
						  :fetcher github :files (:defaults "data") :source
						  "MELPA" :id all-the-icons :type git :protocol https
						  :inherit t :depth treeless :ref
						  "4778632b29c8c8d2b7cd9ce69535d0be01d846f9"))
 (all-the-icons-dired :source "elpaca-menu-lock-file" :recipe
					  (:package "all-the-icons-dired" :repo
								"wyuenho/all-the-icons-dired" :fetcher github
								:files
								("*.el" "*.el.in" "dir" "*.info" "*.texi"
								 "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
								 "doc/*.texinfo" "lisp/*.el" "docs/dir"
								 "docs/*.info" "docs/*.texi" "docs/*.texinfo"
								 (:exclude ".dir-locals.el" "test.el" "tests.el"
										   "*-test.el" "*-tests.el" "LICENSE"
										   "README*" "*-pkg.el"))
								:source "MELPA" :id all-the-icons-dired :type
								git :protocol https :inherit t :depth treeless
								:ref "e157f0668f22ed586aebe0a2c0186ab07702986c"))
 (async :source "elpaca-menu-lock-file" :recipe
		(:package "async" :repo "jwiegley/emacs-async" :fetcher github :files
				  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
				   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
				   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
				   "docs/*.texinfo"
				   (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							 "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				  :source "MELPA" :id async :type git :protocol https :inherit t
				  :depth treeless :ref
				  "4fdcb061a166e0d6ccc27d3829a28e04415ae825"))
 (auto-compile :source "elpaca-menu-lock-file" :recipe
			   (:package "auto-compile" :fetcher github :repo
						 "emacscollective/auto-compile" :files
						 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						  "docs/*.texinfo"
						  (:exclude ".dir-locals.el" "test.el" "tests.el"
									"*-test.el" "*-tests.el" "LICENSE" "README*"
									"*-pkg.el"))
						 :source "MELPA" :id auto-compile :type git :protocol
						 https :inherit t :depth treeless :ref
						 "7cef668d6f10b29e0a7f4524a663f315198fd55c"))
 (avy :source "elpaca-menu-lock-file" :recipe
	  (:package "avy" :repo "abo-abo/avy" :fetcher github :files
				("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo" "doc/dir"
				 "doc/*.info" "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
				 "docs/dir" "docs/*.info" "docs/*.texi" "docs/*.texinfo"
				 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
						   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				:source "MELPA" :id avy :type git :protocol https :inherit t
				:depth treeless :ref "933d1f36cca0f71e4acb5fac707e9ae26c536264"))
 (benchmark-init :source "elpaca-menu-lock-file" :recipe
				 (:package "benchmark-init" :fetcher github :repo
						   "dholm/benchmark-init-el" :files
						   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
							"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
							"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
							"docs/*.texinfo"
							(:exclude ".dir-locals.el" "test.el" "tests.el"
									  "*-test.el" "*-tests.el" "LICENSE"
									  "README*" "*-pkg.el"))
						   :source "MELPA" :id benchmark-init :type git
						   :protocol https :inherit t :depth treeless :ref
						   "54b9703389f25012e4cc20fe4a0d4ea253ce4820"))
 (bui :source "elpaca-menu-lock-file" :recipe
	  (:package "bui" :repo "alezost/bui.el" :fetcher github :files
				("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo" "doc/dir"
				 "doc/*.info" "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
				 "docs/dir" "docs/*.info" "docs/*.texi" "docs/*.texinfo"
				 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
						   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				:source "MELPA" :id bui :type git :protocol https :inherit t
				:depth treeless :ref "4319e1bf3ff94ff0568eed280ac1f980a4b68679"))
 (centaur-tabs :source "elpaca-menu-lock-file" :recipe
			   (:package "centaur-tabs" :repo "ema2159/centaur-tabs" :fetcher
						 github :files
						 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						  "docs/*.texinfo"
						  (:exclude ".dir-locals.el" "test.el" "tests.el"
									"*-test.el" "*-tests.el" "LICENSE" "README*"
									"*-pkg.el"))
						 :source "MELPA" :id centaur-tabs :type git :protocol
						 https :inherit t :depth treeless :ref
						 "24490495bce04bec2b8b3718f71f82e73a856602"))
 (cfrs :source "elpaca-menu-lock-file" :recipe
	   (:package "cfrs" :repo "Alexander-Miller/cfrs" :fetcher github :files
				 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo" "doc/dir"
				  "doc/*.info" "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
				  "docs/dir" "docs/*.info" "docs/*.texi" "docs/*.texinfo"
				  (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							"*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				 :source "MELPA" :id cfrs :type git :protocol https :inherit t
				 :depth treeless :ref "981bddb3fb9fd9c58aed182e352975bd10ad74c8"))
 (cmake-mode :source "elpaca-menu-lock-file" :recipe
			 (:package "cmake-mode" :fetcher git :url
					   "https://gitlab.kitware.com/cmake/cmake.git" :files
					   ("Auxiliary/*.el") :source "MELPA" :id cmake-mode :type
					   git :protocol https :inherit t :depth treeless :ref
					   "60b012591bbf5f14585da04d0a8013115d0261dc"))
 (company :source "elpaca-menu-lock-file" :recipe
		  (:package "company" :fetcher github :repo "company-mode/company-mode"
					:files
					(:defaults "icons" ("images/small" "doc/images/small/*.png"))
					:source "MELPA" :id company :type git :protocol https
					:inherit t :depth treeless :ref
					"0790d828bf74c49cc270934b6d2eafbd4640e75d"))
 (company-c-headers :source "elpaca-menu-lock-file" :recipe
					(:package "company-c-headers" :repo
							  "randomphrase/company-c-headers" :fetcher github
							  :files
							  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
							   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
							   "doc/*.texinfo" "lisp/*.el" "docs/dir"
							   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
							   (:exclude ".dir-locals.el" "test.el" "tests.el"
										 "*-test.el" "*-tests.el" "LICENSE"
										 "README*" "*-pkg.el"))
							  :source "MELPA" :id company-c-headers :type git
							  :protocol https :inherit t :depth treeless :ref
							  "986cef8c7aae821ae65b193ea15e7f4a7097821c"))
 (company-glsl :source "elpaca-menu-lock-file" :recipe
			   (:package "company-glsl" :fetcher github :repo
						 "guidoschmidt/company-glsl" :files
						 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						  "docs/*.texinfo"
						  (:exclude ".dir-locals.el" "test.el" "tests.el"
									"*-test.el" "*-tests.el" "LICENSE" "README*"
									"*-pkg.el"))
						 :source "MELPA" :id company-glsl :type git :protocol
						 https :inherit t :depth treeless :ref
						 "3a40501ba831a30a7fd3e8529b20d1305d0454aa"))
 (company-prescient :source "elpaca-menu-lock-file" :recipe
					(:package "company-prescient" :fetcher github :repo
							  "radian-software/prescient.el" :files
							  ("company-prescient.el") :source "MELPA" :id
							  company-prescient :type git :protocol https
							  :inherit t :depth treeless :ref
							  "ae52777d6b6b856b54c85441c7a713949f1720de"))
 (compat :source "elpaca-menu-lock-file" :recipe
		 (:package "compat" :repo
				   ("https://github.com/emacs-compat/compat" . "compat") :tar
				   "31.1.0.0" :host gnu :files ("*" (:exclude ".git")) :source
				   "GNU ELPA" :id compat :type git :protocol https :inherit t
				   :depth treeless :ref
				   "90880f81419577e1d3f68424d2a3adf31e6d663e"))
 (cond-let :source "elpaca-menu-lock-file" :recipe
		   (:package "cond-let" :fetcher github :repo "tarsius/cond-let" :files
					 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					  "docs/*.texinfo"
					  (:exclude ".dir-locals.el" "test.el" "tests.el"
								"*-test.el" "*-tests.el" "LICENSE" "README*"
								"*-pkg.el"))
					 :source "MELPA" :id cond-let :type git :protocol https
					 :inherit t :depth treeless :ref
					 "09292a77001434f59ab55c775dec2b98cb18d028"))
 (consult :source "elpaca-menu-lock-file" :recipe
		  (:package "consult" :repo "minad/consult" :fetcher github :files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id consult :type git :protocol https
					:inherit t :depth treeless :ref
					"a64569f377b8bc0f62e1d2ae0f3ee48ba4a7cc1c"))
 (consult-flycheck :source "elpaca-menu-lock-file" :recipe
				   (:package "consult-flycheck" :fetcher github :repo
							 "minad/consult-flycheck" :files
							 ("*.el" "*.el.in" "dir" "*.info" "*.texi"
							  "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
							  "doc/*.texinfo" "lisp/*.el" "docs/dir"
							  "docs/*.info" "docs/*.texi" "docs/*.texinfo"
							  (:exclude ".dir-locals.el" "test.el" "tests.el"
										"*-test.el" "*-tests.el" "LICENSE"
										"README*" "*-pkg.el"))
							 :source "MELPA" :id consult-flycheck :type git
							 :protocol https :inherit t :depth treeless :ref
							 "087454a31b51ec007365f8e92a04e69409f294d3"))
 (consult-project-extra :source "elpaca-menu-lock-file" :recipe
						(:package "consult-project-extra" :fetcher github :repo
								  "Qkessler/consult-project-extra" :files
								  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
								   "*.texinfo" "doc/dir" "doc/*.info"
								   "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
								   "docs/dir" "docs/*.info" "docs/*.texi"
								   "docs/*.texinfo"
								   (:exclude ".dir-locals.el" "test.el"
											 "tests.el" "*-test.el" "*-tests.el"
											 "LICENSE" "README*" "*-pkg.el"))
								  :source "MELPA" :id consult-project-extra
								  :type git :protocol https :inherit t :depth
								  treeless :ref
								  "52c453b7f85dea90cc53ff8fba750795606415df"))
 (dap-mode :source "elpaca-menu-lock-file" :recipe
		   (:package "dap-mode" :repo "emacs-lsp/dap-mode" :fetcher github
					 :files (:defaults "icons") :source "MELPA" :id dap-mode
					 :type git :protocol https :inherit t :depth treeless :ref
					 "7372c429031ad37adb88b42e4a2f4cfff246ce55"))
 (dash :source "elpaca-menu-lock-file" :recipe
	   (:package "dash" :fetcher github :repo "magnars/dash.el" :files
				 ("dash.el" "dash.texi") :source "MELPA" :id dash :type git
				 :protocol https :inherit t :depth treeless :ref
				 "d746dd9edcb67a108818beb0cdc78dc1cb466832"))
 (dashboard :source "elpaca-menu-lock-file" :recipe
			(:package "dashboard" :fetcher github :repo
					  "emacs-dashboard/dashboard" :files (:defaults "banners")
					  :source "MELPA" :id dashboard :type git :protocol https
					  :inherit t :depth treeless :ref
					  "a2c49ba27f3a906fd8b059da55104c1ec562b8b6"))
 (deft :source "elpaca-menu-lock-file" :recipe
	   (:package "deft" :repo "jrblevin/deft" :fetcher github :files
				 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo" "doc/dir"
				  "doc/*.info" "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
				  "docs/dir" "docs/*.info" "docs/*.texi" "docs/*.texinfo"
				  (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							"*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				 :source "MELPA" :id deft :type git :protocol https :inherit t
				 :depth treeless :ref "b369d7225d86551882568788a23c5497b232509c"))
 (diff-hl :source "elpaca-menu-lock-file" :recipe
		  (:package "diff-hl" :fetcher github :repo "dgutov/diff-hl" :files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id diff-hl :type git :protocol https
					:inherit t :depth treeless :ref
					"8dfb5c27ea43b8c7ac1c008bb97090ad4f059285"))
 (elfeed :source "elpaca-menu-lock-file" :recipe
		 (:package "elfeed" :fetcher github :repo "emacs-elfeed/elfeed" :files
				   (:defaults "README.md") :source "MELPA" :id elfeed :type git
				   :protocol https :inherit t :depth treeless :ref
				   "4c962a423c9f3eef9472555fccecf268f9d380fe"))
 (elisp-refs :source "elpaca-menu-lock-file" :recipe
			 (:package "elisp-refs" :repo "Wilfred/elisp-refs" :fetcher github
					   :files (:defaults (:exclude "elisp-refs-bench.el"))
					   :source "MELPA" :id elisp-refs :type git :protocol https
					   :inherit t :depth treeless :ref
					   "541a064c3ce27867872cf708354a65d83baf2a6d"))
 (elpaca :source
   "elpaca-menu-lock-file" :recipe
   (:source "Init file" :package "elpaca" :id elpaca :repo
			"https://github.com/progfolio/elpaca.git" :ref
			"7763ede8babd238b7a9a5835833ef4f4bdc4e53e" :depth 1 :inherit ignore
			:files (:defaults "elpaca-test.el" (:exclude "extensions")) :build
			(:not elpaca-activate) :type git :protocol https))
 (emacsql :source "elpaca-menu-lock-file" :recipe
		  (:package "emacsql" :fetcher github :repo "magit/emacsql" :files
					(:defaults "README.org") :source "MELPA" :id emacsql :type
					git :protocol https :inherit t :depth treeless :ref
					"7a4c607912c8fdd1fca4def4915d68f43b12d4da"))
 (evil :source "elpaca-menu-lock-file" :recipe
	   (:package "evil" :repo "emacs-evil/evil" :fetcher github :files
				 (:defaults "doc/build/texinfo/evil.texi"
							(:exclude "evil-test-helpers.el"))
				 :source "MELPA" :id evil :type git :protocol https :inherit t
				 :depth treeless :ref "6a3e1ddd04ac504a016590940d0af2a3361b9efd"))
 (evil-collection :source "elpaca-menu-lock-file" :recipe
				  (:package "evil-collection" :fetcher github :repo
							"emacs-evil/evil-collection" :files
							(:defaults "modes") :source "MELPA" :id
							evil-collection :type git :protocol https :inherit t
							:depth treeless :ref
							"3948a7890960d389dffa637203a6760df68b1c1c"))
 (evil-nerd-commenter :source "elpaca-menu-lock-file" :recipe
					  (:package "evil-nerd-commenter" :fetcher github :repo
								"redguardtoo/evil-nerd-commenter" :files
								("*.el" "*.el.in" "dir" "*.info" "*.texi"
								 "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
								 "doc/*.texinfo" "lisp/*.el" "docs/dir"
								 "docs/*.info" "docs/*.texi" "docs/*.texinfo"
								 (:exclude ".dir-locals.el" "test.el" "tests.el"
										   "*-test.el" "*-tests.el" "LICENSE"
										   "README*" "*-pkg.el"))
								:source "MELPA" :id evil-nerd-commenter :type
								git :protocol https :inherit t :depth treeless
								:ref "db5ee61a6e75db074b7d20e9dcb68e0b94b4edc7"))
 (f :source "elpaca-menu-lock-file" :recipe
	(:package "f" :fetcher github :repo "rejeep/f.el" :files
			  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo" "doc/dir"
			   "doc/*.info" "doc/*.texi" "doc/*.texinfo" "lisp/*.el" "docs/dir"
			   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
			   (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
						 "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
			  :source "MELPA" :id f :type git :protocol https :inherit t :depth
			  treeless :ref "931b6d0667fe03e7bf1c6c282d6d8d7006143c52"))
 (flycheck :source "elpaca-menu-lock-file" :recipe
		   (:package "flycheck" :repo "flycheck/flycheck" :fetcher github :files
					 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					  "docs/*.texinfo"
					  (:exclude ".dir-locals.el" "test.el" "tests.el"
								"*-test.el" "*-tests.el" "LICENSE" "README*"
								"*-pkg.el"))
					 :source "MELPA" :id flycheck :type git :protocol https
					 :inherit t :depth treeless :ref
					 "0707e3426edf8dd9529bd8ad1058eb0b3add4507"))
 (flycheck-clang-tidy :source "elpaca-menu-lock-file" :recipe
					  (:package "flycheck-clang-tidy" :fetcher github :repo
								"ch1bo/flycheck-clang-tidy" :files
								("*.el" "*.el.in" "dir" "*.info" "*.texi"
								 "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
								 "doc/*.texinfo" "lisp/*.el" "docs/dir"
								 "docs/*.info" "docs/*.texi" "docs/*.texinfo"
								 (:exclude ".dir-locals.el" "test.el" "tests.el"
										   "*-test.el" "*-tests.el" "LICENSE"
										   "README*" "*-pkg.el"))
								:source "MELPA" :id flycheck-clang-tidy :type
								git :protocol https :inherit t :depth treeless
								:ref "f9ae7306bd6ca08b689b36c1e8f6f6b91d61db5f"))
 (flycheck-package :source "elpaca-menu-lock-file" :recipe
				   (:package "flycheck-package" :fetcher github :repo
							 "purcell/flycheck-package" :files
							 ("*.el" "*.el.in" "dir" "*.info" "*.texi"
							  "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
							  "doc/*.texinfo" "lisp/*.el" "docs/dir"
							  "docs/*.info" "docs/*.texi" "docs/*.texinfo"
							  (:exclude ".dir-locals.el" "test.el" "tests.el"
										"*-test.el" "*-tests.el" "LICENSE"
										"README*" "*-pkg.el"))
							 :source "MELPA" :id flycheck-package :type git
							 :protocol https :inherit t :depth treeless :ref
							 "a52e4e95f3151898b36739dfdb4a98b368626fc0"))
 (flyspell-correct :source "elpaca-menu-lock-file" :recipe
				   (:package "flyspell-correct" :repo
							 "d12frosted/flyspell-correct" :fetcher github
							 :files
							 ("flyspell-correct.el" "flyspell-correct-ido.el")
							 :source "MELPA" :id flyspell-correct :type git
							 :protocol https :inherit t :depth treeless :ref
							 "cabf0c9bdba3a08ae3c517302ea6ad55cd638098"))
 (general :source "elpaca-menu-lock-file" :recipe
		  (:package "general" :fetcher github :repo "noctuid/general.el" :files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id general :type git :protocol https
					:inherit t :depth treeless :ref
					"a48768f85a655fe77b5f45c2880b420da1b1b9c3"))
 (glsl-mode :source "elpaca-menu-lock-file" :recipe
			(:package "glsl-mode" :repo "jimhourihan/glsl-mode" :fetcher github
					  :files
					  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					   "docs/*.texinfo"
					   (:exclude ".dir-locals.el" "test.el" "tests.el"
								 "*-test.el" "*-tests.el" "LICENSE" "README*"
								 "*-pkg.el"))
					  :source "MELPA" :id glsl-mode :type git :protocol https
					  :inherit t :depth treeless :ref
					  "854e6e5c9a971634c9d40501b4ef3ca71881739b"))
 (gntp :source "elpaca-menu-lock-file" :recipe
	   (:package "gntp" :repo "tekai/gntp.el" :fetcher github :files
				 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo" "doc/dir"
				  "doc/*.info" "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
				  "docs/dir" "docs/*.info" "docs/*.texi" "docs/*.texinfo"
				  (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							"*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				 :source "MELPA" :id gntp :type git :protocol https :inherit t
				 :depth treeless :ref "767571135e2c0985944017dc59b0be79af222ef5"))
 (go-mode :source "elpaca-menu-lock-file" :recipe
		  (:package "go-mode" :repo "dominikh/go-mode.el" :fetcher github :files
					("go-mode.el") :source "MELPA" :id go-mode :type git
					:protocol https :inherit t :depth treeless :ref
					"3a71d28ab47df685e54ca6046a7a3dd3e28b682c"))
 (goto-chg :source "elpaca-menu-lock-file" :recipe
		   (:package "goto-chg" :repo "emacs-evil/goto-chg" :fetcher github
					 :files
					 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					  "docs/*.texinfo"
					  (:exclude ".dir-locals.el" "test.el" "tests.el"
								"*-test.el" "*-tests.el" "LICENSE" "README*"
								"*-pkg.el"))
					 :source "MELPA" :id goto-chg :type git :protocol https
					 :inherit t :depth treeless :ref
					 "72f556524b88e9d30dc7fc5b0dc32078c166fda7"))
 (helpful :source "elpaca-menu-lock-file" :recipe
		  (:package "helpful" :repo "Wilfred/helpful" :fetcher github :files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id helpful :type git :protocol https
					:inherit t :depth treeless :ref
					"03756fa6ad4dcca5e0920622b1ee3f70abfc4e39"))
 (hl-todo :source "elpaca-menu-lock-file" :recipe
		  (:package "hl-todo" :fetcher github :repo "tarsius/hl-todo" :files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id hl-todo :type git :protocol https
					:inherit t :depth treeless :ref
					"d25aa5a2e78f70331de2b3455d8ef85bd945356b"))
 (ht :source "elpaca-menu-lock-file" :recipe
	 (:package "ht" :fetcher github :repo "Wilfred/ht.el" :files
			   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo" "doc/dir"
				"doc/*.info" "doc/*.texi" "doc/*.texinfo" "lisp/*.el" "docs/dir"
				"docs/*.info" "docs/*.texi" "docs/*.texinfo"
				(:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
						  "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
			   :source "MELPA" :id ht :type git :protocol https :inherit t
			   :depth treeless :ref "1c49aad1c820c86f7ee35bf9fff8429502f60fef"))
 (htmlize :source "elpaca-menu-lock-file" :recipe
		  (:package "htmlize" :fetcher github :repo "emacsorphanage/htmlize"
					:files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id htmlize :type git :protocol https
					:inherit t :depth treeless :ref
					"fa644880699adea3770504f913e6dddbec90c076"))
 (hungry-delete :source "elpaca-menu-lock-file" :recipe
				(:package "hungry-delete" :fetcher github :repo
						  "nflath/hungry-delete" :files
						  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						   "docs/*.texinfo"
						   (:exclude ".dir-locals.el" "test.el" "tests.el"
									 "*-test.el" "*-tests.el" "LICENSE"
									 "README*" "*-pkg.el"))
						  :source "MELPA" :id hungry-delete :type git :protocol
						  https :inherit t :depth treeless :ref
						  "d919e555e5c13a2edf4570f3ceec84f0ade71657"))
 (hybrid-reverse-theme :source "elpaca-menu-lock-file" :recipe
					   (:package "hybrid-reverse-theme" :repo
								 "Riyyi/emacs-hybrid-reverse" :fetcher github
								 :files
								 ("*.el" "*.el.in" "dir" "*.info" "*.texi"
								  "*.texinfo" "doc/dir" "doc/*.info"
								  "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
								  "docs/dir" "docs/*.info" "docs/*.texi"
								  "docs/*.texinfo"
								  (:exclude ".dir-locals.el" "test.el"
											"tests.el" "*-test.el" "*-tests.el"
											"LICENSE" "README*" "*-pkg.el"))
								 :source "MELPA" :id hybrid-reverse-theme :type
								 git :protocol https :inherit t :depth treeless
								 :ref "5c60e7428d3c135c5f027d09f4474ed776f80d8d"))
 (hydra :source "elpaca-menu-lock-file" :recipe
		(:package "hydra" :repo "abo-abo/hydra" :fetcher github :files
				  (:defaults (:exclude "lv.el")) :source "MELPA" :id hydra :type
				  git :protocol https :inherit t :depth treeless :ref
				  "59a2a45a35027948476d1d7751b0f0215b1e61aa"))
 (jq-mode :source "elpaca-menu-lock-file" :recipe
		  (:package "jq-mode" :repo "ljos/jq-mode" :fetcher github :files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id jq-mode :type git :protocol https
					:inherit t :depth treeless :ref
					"558f2af06c34f12c52097f8db746169c28c35484"))
 (kotlin-mode :source "elpaca-menu-lock-file" :recipe
			  (:package "kotlin-mode" :repo
						"Emacs-Kotlin-Mode-Maintainers/kotlin-mode" :fetcher
						github :files
						("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						 "docs/*.texinfo"
						 (:exclude ".dir-locals.el" "test.el" "tests.el"
								   "*-test.el" "*-tests.el" "LICENSE" "README*"
								   "*-pkg.el"))
						:source "MELPA" :id kotlin-mode :type git :protocol
						https :inherit t :depth treeless :ref
						"fddd747e5b4736e8b27a147960f369b86179ddff"))
 (llama :source "elpaca-menu-lock-file" :recipe
		(:package "llama" :fetcher github :repo "tarsius/llama" :files
				  ("llama.el" ".dir-locals.el") :source "MELPA" :id llama :type
				  git :protocol https :inherit t :depth treeless :ref
				  "6850d0c91b629da14fdff2300c222289d1a0029a"))
 (log4e :source "elpaca-menu-lock-file" :recipe
		(:package "log4e" :repo "aki2o/log4e" :fetcher github :files
				  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
				   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
				   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
				   "docs/*.texinfo"
				   (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							 "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				  :source "MELPA" :id log4e :type git :protocol https :inherit t
				  :depth treeless :ref
				  "6d71462df9bf595d3861bfb328377346aceed422"))
 (lsp-docker :source "elpaca-menu-lock-file" :recipe
			 (:package "lsp-docker" :repo "emacs-lsp/lsp-docker" :fetcher github
					   :files
					   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						"docs/*.texinfo"
						(:exclude ".dir-locals.el" "test.el" "tests.el"
								  "*-test.el" "*-tests.el" "LICENSE" "README*"
								  "*-pkg.el"))
					   :source "MELPA" :id lsp-docker :type git :protocol https
					   :inherit t :depth treeless :ref
					   "f666fba72b496c7750bb3f349771b07aa51714f0"))
 (lsp-mode :source "elpaca-menu-lock-file" :recipe
		   (:package "lsp-mode" :repo "emacs-lsp/lsp-mode" :fetcher github
					 :files (:defaults "clients/*.*") :source "MELPA" :id
					 lsp-mode :type git :protocol https :inherit t :depth
					 treeless :ref "aebc8755d1cf6667382799e5168a67b6a6289a27"))
 (lsp-sourcekit :source "elpaca-menu-lock-file" :recipe
				(:package "lsp-sourcekit" :repo "emacs-lsp/lsp-sourcekit"
						  :fetcher github :files
						  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						   "docs/*.texinfo"
						   (:exclude ".dir-locals.el" "test.el" "tests.el"
									 "*-test.el" "*-tests.el" "LICENSE"
									 "README*" "*-pkg.el"))
						  :source "MELPA" :id lsp-sourcekit :type git :protocol
						  https :inherit t :depth treeless :ref
						  "8d5dac4e18e6c39e34ce5504f93a6a876d8e12db"))
 (lsp-treemacs :source "elpaca-menu-lock-file" :recipe
			   (:package "lsp-treemacs" :repo "emacs-lsp/lsp-treemacs" :fetcher
						 github :files (:defaults "icons") :source "MELPA" :id
						 lsp-treemacs :type git :protocol https :inherit t
						 :depth treeless :ref
						 "3519ac907ea391e18d9599375b116aeeb6f8a38a"))
 (lsp-ui :source "elpaca-menu-lock-file" :recipe
		 (:package "lsp-ui" :repo "emacs-lsp/lsp-ui" :fetcher github :files
				   (:defaults "lsp-ui-doc.html" "resources") :source "MELPA" :id
				   lsp-ui :type git :protocol https :inherit t :depth treeless
				   :ref "176eca71d1c5498ed6258b5b27d73293ff7cd7ed"))
 (lua-mode :source "elpaca-menu-lock-file" :recipe
		   (:package "lua-mode" :repo "immerrr/lua-mode" :fetcher github :files
					 (:defaults (:exclude "init-tryout.el")) :source "MELPA" :id
					 lua-mode :type git :protocol https :inherit t :depth
					 treeless :ref "2f6b8d7a6317e42c953c5119b0119ddb337e0a5f"))
 (lv :source "elpaca-menu-lock-file" :recipe
	 (:package "lv" :repo "abo-abo/hydra" :fetcher github :files ("lv.el")
			   :source "MELPA" :id lv :type git :protocol https :inherit t
			   :depth treeless :ref "59a2a45a35027948476d1d7751b0f0215b1e61aa"))
 (magit :source "elpaca-menu-lock-file" :recipe
		(:package "magit" :fetcher github :repo "magit/magit" :files
				  ("lisp/magit*.el" "lisp/git-*.el" "docs/magit.texi"
				   "docs/AUTHORS.md" "LICENSE" ".dir-locals.el"
				   ("githooks" "githooks/*") (:exclude "lisp/magit-section.el"))
				  :source "MELPA" :id magit :type git :protocol https :inherit t
				  :depth treeless :ref
				  "65232f488caae960029cc68bcc607aea340fa3b1"))
 (magit-section :source "elpaca-menu-lock-file" :recipe
				(:package "magit-section" :fetcher github :repo "magit/magit"
						  :files
						  ("lisp/magit-section.el" "docs/magit-section.texi")
						  :source "MELPA" :id magit-section :type git :protocol
						  https :inherit t :depth treeless :ref
						  "65232f488caae960029cc68bcc607aea340fa3b1"))
 (magit-todos :source "elpaca-menu-lock-file" :recipe
			  (:package "magit-todos" :fetcher github :repo
						"alphapapa/magit-todos" :files
						("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						 "docs/*.texinfo"
						 (:exclude ".dir-locals.el" "test.el" "tests.el"
								   "*-test.el" "*-tests.el" "LICENSE" "README*"
								   "*-pkg.el"))
						:source "MELPA" :id magit-todos :type git :protocol
						https :inherit t :depth treeless :ref
						"7294a95580bddf7232f2d205efae312dc24c5f61"))
 (marginalia :source "elpaca-menu-lock-file" :recipe
			 (:package "marginalia" :fetcher github :repo "minad/marginalia"
					   :files
					   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						"docs/*.texinfo"
						(:exclude ".dir-locals.el" "test.el" "tests.el"
								  "*-test.el" "*-tests.el" "LICENSE" "README*"
								  "*-pkg.el"))
					   :source "MELPA" :id marginalia :type git :protocol https
					   :inherit t :depth treeless :ref
					   "381af583d2530796b9955ff2fe0cba3ad3119943"))
 (markdown-mode :source "elpaca-menu-lock-file" :recipe
				(:package "markdown-mode" :fetcher github :repo
						  "jrblevin/markdown-mode" :files
						  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						   "docs/*.texinfo"
						   (:exclude ".dir-locals.el" "test.el" "tests.el"
									 "*-test.el" "*-tests.el" "LICENSE"
									 "README*" "*-pkg.el"))
						  :source "MELPA" :id markdown-mode :type git :protocol
						  https :inherit t :depth treeless :ref
						  "e2e2bc753b4330f85b6ea7e62cd0552e8ea47b76"))
 (mu4e-alert :source "elpaca-menu-lock-file" :recipe
			 (:package "mu4e-alert" :fetcher github :repo "xzz53/mu4e-alert"
					   :files
					   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						"docs/*.texinfo"
						(:exclude ".dir-locals.el" "test.el" "tests.el"
								  "*-test.el" "*-tests.el" "LICENSE" "README*"
								  "*-pkg.el"))
					   :source "MELPA" :id mu4e-alert :type git :protocol https
					   :inherit t :depth treeless :ref
					   "9f20f30b15a5f5cc43fe448684fe1d4b981639aa"))
 (neotree :source "elpaca-menu-lock-file" :recipe
		  (:package "neotree" :repo "jaypei/emacs-neotree" :fetcher github
					:files (:defaults "icons") :source "MELPA" :id neotree :type
					git :protocol https :inherit t :depth treeless :ref
					"3178805a0942696d1e5162575d9cab43d14b7970"))
 (nix-mode :source "elpaca-menu-lock-file" :recipe
		   (:package "nix-mode" :fetcher github :repo "NixOS/nix-mode" :files
					 (:defaults (:exclude "nix-company.el" "nix-mode-mmm.el"))
					 :source "MELPA" :id nix-mode :type git :protocol https
					 :inherit t :depth treeless :ref
					 "2c77e7e0b7540efbb20ccaee3557ef90a5dc77f0"))
 (odin-mode :source "elpaca-menu-lock-file" :recipe
			(:source "Init file" :package "odin-mode" :id odin-mode :repo
					 "https://github.com/mattt-b/odin-mode.git" :depth 1 :type
					 git :protocol https :inherit t :ref
					 "21c6ff8b49f5eaa2d3b9969feeb08de921f11e92"))
 (org-bullets :source "elpaca-menu-lock-file" :recipe
			  (:package "org-bullets" :fetcher github :repo
						"integral-dw/org-bullets" :files
						("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						 "docs/*.texinfo"
						 (:exclude ".dir-locals.el" "test.el" "tests.el"
								   "*-test.el" "*-tests.el" "LICENSE" "README*"
								   "*-pkg.el"))
						:source "MELPA" :id org-bullets :type git :protocol
						https :inherit t :depth treeless :ref
						"767f55feb58b840a5a04eabfc3fbbf0d257c4792"))
 (org-roam :source "elpaca-menu-lock-file" :recipe
		   (:package "org-roam" :fetcher github :repo "org-roam/org-roam" :files
					 (:defaults "extensions/*") :source "MELPA" :id org-roam
					 :type git :protocol https :inherit t :depth treeless :ref
					 "903bd4ec56d29247990d005ed9052c201e18b812"))
 (org-roam-ui :source "elpaca-menu-lock-file" :recipe
			  (:package "org-roam-ui" :fetcher github :repo
						"org-roam/org-roam-ui" :files (:defaults "out") :source
						"MELPA" :id org-roam-ui :type git :protocol https
						:inherit t :depth treeless :ref
						"2894dcbf56d2eca8d3cae2b1ae183f51724b5db6"))
 (ox-gfm :source "elpaca-menu-lock-file" :recipe
		 (:package "ox-gfm" :fetcher github :repo "larstvei/ox-gfm" :files
				   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					"docs/*.texinfo"
					(:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							  "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				   :source "MELPA" :id ox-gfm :type git :protocol https :inherit
				   t :depth treeless :ref
				   "4f774f13d34b3db9ea4ddb0b1edc070b1526ccbb"))
 (package-lint :source "elpaca-menu-lock-file" :recipe
			   (:package "package-lint" :fetcher github :repo
						 "purcell/package-lint" :files
						 (:defaults "data" (:exclude "*flymake.el")) :source
						 "MELPA" :id package-lint :type git :protocol https
						 :inherit t :depth treeless :ref
						 "1865be780a16098f972fef50a52b21ca6ee04df9"))
 (page-break-lines :source "elpaca-menu-lock-file" :recipe
				   (:package "page-break-lines" :fetcher github :repo
							 "purcell/page-break-lines" :files
							 ("*.el" "*.el.in" "dir" "*.info" "*.texi"
							  "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
							  "doc/*.texinfo" "lisp/*.el" "docs/dir"
							  "docs/*.info" "docs/*.texi" "docs/*.texinfo"
							  (:exclude ".dir-locals.el" "test.el" "tests.el"
										"*-test.el" "*-tests.el" "LICENSE"
										"README*" "*-pkg.el"))
							 :source "MELPA" :id page-break-lines :type git
							 :protocol https :inherit t :depth treeless :ref
							 "bd5eecd6580481fc37ed41c32d3c18cb49f4af57"))
 (pcre2el :source "elpaca-menu-lock-file" :recipe
		  (:package "pcre2el" :fetcher github :repo "joddie/pcre2el" :files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id pcre2el :type git :protocol https
					:inherit t :depth treeless :ref
					"b4d846d80dddb313042131cf2b8fbf647567e000"))
 (pfuture :source "elpaca-menu-lock-file" :recipe
		  (:package "pfuture" :repo "Alexander-Miller/pfuture" :fetcher github
					:files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id pfuture :type git :protocol https
					:inherit t :depth treeless :ref
					"19b53aebbc0f2da31de6326c495038901bffb73c"))
 (php-mode :source "elpaca-menu-lock-file" :recipe
		   (:package "php-mode" :repo "emacs-php/php-mode" :fetcher github
					 :files
					 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					  "docs/*.texinfo"
					  (:exclude ".dir-locals.el" "test.el" "tests.el"
								"*-test.el" "*-tests.el" "LICENSE" "README*"
								"*-pkg.el"))
					 :source "MELPA" :id php-mode :type git :protocol https
					 :inherit t :depth treeless :ref
					 "0e32f79ffca49578eba452d38b62e434e517df5e"))
 (posframe :source "elpaca-menu-lock-file" :recipe
		   (:package "posframe" :fetcher github :repo "tumashu/posframe" :files
					 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					  "docs/*.texinfo"
					  (:exclude ".dir-locals.el" "test.el" "tests.el"
								"*-test.el" "*-tests.el" "LICENSE" "README*"
								"*-pkg.el"))
					 :source "MELPA" :id posframe :type git :protocol https
					 :inherit t :depth treeless :ref
					 "1a6a25c58559ef43821a071c43b23de5cbc3cc3a"))
 (powerline :source "elpaca-menu-lock-file" :recipe
			(:package "powerline" :fetcher github :repo "milkypostman/powerline"
					  :files
					  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					   "docs/*.texinfo"
					   (:exclude ".dir-locals.el" "test.el" "tests.el"
								 "*-test.el" "*-tests.el" "LICENSE" "README*"
								 "*-pkg.el"))
					  :source "MELPA" :id powerline :type git :protocol https
					  :inherit t :depth treeless :ref
					  "c35c35bdf5ce2d992882c1f06f0f078058870d4a"))
 (prescient :source "elpaca-menu-lock-file" :recipe
			(:package "prescient" :fetcher github :repo
					  "radian-software/prescient.el" :files ("prescient.el")
					  :source "MELPA" :id prescient :type git :protocol https
					  :inherit t :depth treeless :ref
					  "ae52777d6b6b856b54c85441c7a713949f1720de"))
 (queue :source "elpaca-menu-lock-file" :recipe
		(:package "queue" :repo
				  ("https://github.com/emacsmirror/gnu_elpa" . "queue") :tar
				  "0.2" :host gnu :branch "externals/queue" :files
				  ("*" (:exclude ".git")) :source "GNU ELPA" :id queue :type git
				  :protocol https :inherit t :depth treeless :ref
				  "f986fb68e75bdae951efb9e11a3012ab6bd408ee"))
 (rainbow-delimiters :source "elpaca-menu-lock-file" :recipe
					 (:package "rainbow-delimiters" :fetcher github :repo
							   "Fanael/rainbow-delimiters" :files
							   ("*.el" "*.el.in" "dir" "*.info" "*.texi"
								"*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
								"doc/*.texinfo" "lisp/*.el" "docs/dir"
								"docs/*.info" "docs/*.texi" "docs/*.texinfo"
								(:exclude ".dir-locals.el" "test.el" "tests.el"
										  "*-test.el" "*-tests.el" "LICENSE"
										  "README*" "*-pkg.el"))
							   :source "MELPA" :id rainbow-delimiters :type git
							   :protocol https :inherit t :depth treeless :ref
							   "f40ece58df8b2f0fb6c8576b527755a552a5e763"))
 (rainbow-mode :source "elpaca-menu-lock-file" :recipe
			   (:package "rainbow-mode" :repo
						 ("https://github.com/emacsmirror/gnu_elpa"
						  . "rainbow-mode")
						 :tar "1.0.7" :host gnu :branch "externals/rainbow-mode"
						 :files ("*" (:exclude ".git")) :source "GNU ELPA" :id
						 rainbow-mode :type git :protocol https :inherit t
						 :depth treeless :ref
						 "9d333d3a92132c2a9057d2a39e1ebd8cc575a1bb"))
 (reformatter :source "elpaca-menu-lock-file" :recipe
			  (:package "reformatter" :repo "purcell/emacs-reformatter" :fetcher
						github :files
						("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						 "docs/*.texinfo"
						 (:exclude ".dir-locals.el" "test.el" "tests.el"
								   "*-test.el" "*-tests.el" "LICENSE" "README*"
								   "*-pkg.el"))
						:source "MELPA" :id reformatter :type git :protocol
						https :inherit t :depth treeless :ref
						"2bd8818f3f2119a3876e574a437495214c87bc81"))
 (restclient :source "elpaca-menu-lock-file" :recipe
			 (:package "restclient" :fetcher github :repo
					   "emacsorphanage/restclient" :files ("restclient.el")
					   :source "MELPA" :id restclient :type git :protocol https
					   :inherit t :depth treeless :ref
					   "d280632df39a175dac06037038105e32945624be"))
 (restclient-jq :source "elpaca-menu-lock-file" :recipe
				(:package "restclient-jq" :fetcher github :repo
						  "emacsorphanage/restclient" :files
						  ("restclient-jq.el") :source "MELPA" :id restclient-jq
						  :type git :protocol https :inherit t :depth treeless
						  :ref "d280632df39a175dac06037038105e32945624be"))
 (s :source "elpaca-menu-lock-file" :recipe
	(:package "s" :fetcher github :repo "magnars/s.el" :files
			  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo" "doc/dir"
			   "doc/*.info" "doc/*.texi" "doc/*.texinfo" "lisp/*.el" "docs/dir"
			   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
			   (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
						 "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
			  :source "MELPA" :id s :type git :protocol https :inherit t :depth
			  treeless :ref "d7c04b84d03481a1ed62ee13dbe595224ccbe57c"))
 (setup :source
   "elpaca-menu-lock-file" :recipe
   (:package "setup" :repo ("https://codeberg.org/pkal/setup.el" . "setup") :tar
			 "1.5.0" :host gnu :files ("*" (:exclude ".git")) :source "GNU ELPA"
			 :id setup :type git :protocol https :inherit t :depth treeless :ref
			 "de9b86c6f29cf9888e911924ffc4ce47312320c3"))
 (simple-httpd :source "elpaca-menu-lock-file" :recipe
			   (:package "simple-httpd" :repo "skeeto/emacs-web-server" :fetcher
						 github :files
						 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						  "docs/*.texinfo"
						  (:exclude ".dir-locals.el" "test.el" "tests.el"
									"*-test.el" "*-tests.el" "LICENSE" "README*"
									"*-pkg.el"))
						 :source "MELPA" :id simple-httpd :type git :protocol
						 https :inherit t :depth treeless :ref
						 "0c17124cefddf2d50defcec5f2bd25fa6d1db756"))
 (smart-tabs-mode :source "elpaca-menu-lock-file" :recipe
				  (:package "smart-tabs-mode" :fetcher github :repo
							"jcsalomon/smarttabs" :files
							("*.el" "*.el.in" "dir" "*.info" "*.texi"
							 "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
							 "doc/*.texinfo" "lisp/*.el" "docs/dir"
							 "docs/*.info" "docs/*.texi" "docs/*.texinfo"
							 (:exclude ".dir-locals.el" "test.el" "tests.el"
									   "*-test.el" "*-tests.el" "LICENSE"
									   "README*" "*-pkg.el"))
							:source "MELPA" :id smart-tabs-mode :type git
							:protocol https :inherit t :depth treeless :ref
							"1044c17e42479de943e69cdeb85e4d05ad9cca8c"))
 (spinner :source "elpaca-menu-lock-file" :recipe
		  (:package "spinner" :repo
					("https://github.com/Malabarba/spinner.el" . "spinner") :tar
					"1.7.4" :host gnu :files ("*" (:exclude ".git")) :source
					"GNU ELPA" :id spinner :type git :protocol https :inherit t
					:depth treeless :ref
					"d4647ae87fb0cd24bc9081a3d287c860ff061c21"))
 (super-save :source "elpaca-menu-lock-file" :recipe
			 (:package "super-save" :fetcher github :repo "bbatsov/super-save"
					   :files
					   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						"docs/*.texinfo"
						(:exclude ".dir-locals.el" "test.el" "tests.el"
								  "*-test.el" "*-tests.el" "LICENSE" "README*"
								  "*-pkg.el"))
					   :source "MELPA" :id super-save :type git :protocol https
					   :inherit t :depth treeless :ref
					   "dae7cfe4bba83904d1567e14cbbd7ed141ab37a1"))
 (swift-mode :source "elpaca-menu-lock-file" :recipe
			 (:package "swift-mode" :repo "swift-emacs/swift-mode" :fetcher
					   github :files
					   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						"docs/*.texinfo"
						(:exclude ".dir-locals.el" "test.el" "tests.el"
								  "*-test.el" "*-tests.el" "LICENSE" "README*"
								  "*-pkg.el"))
					   :source "MELPA" :id swift-mode :type git :protocol https
					   :inherit t :depth treeless :ref
					   "b94652eff55e67b4461da504c68db25c872df94c"))
 (telephone-line :source "elpaca-menu-lock-file" :recipe
				 (:package "telephone-line" :repo "dbordak/telephone-line"
						   :fetcher github :files
						   ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
							"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
							"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
							"docs/*.texinfo"
							(:exclude ".dir-locals.el" "test.el" "tests.el"
									  "*-test.el" "*-tests.el" "LICENSE"
									  "README*" "*-pkg.el"))
						   :source "MELPA" :id telephone-line :type git
						   :protocol https :inherit t :depth treeless :ref
						   "6016418a5e1e8e006cc202eff50ff28b594eeca4"))
 (toc-org :source "elpaca-menu-lock-file" :recipe
		  (:package "toc-org" :fetcher github :repo "snosov1/toc-org" :old-names
					(org-toc) :files
					("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					 "docs/*.texinfo"
					 (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							   "*-tests.el" "LICENSE" "README*" "*-pkg.el"))
					:source "MELPA" :id toc-org :type git :protocol https
					:inherit t :depth treeless :ref
					"69165018974a82b397d0869f0c7f0bf7d3b4ee07"))
 (transient :source "elpaca-menu-lock-file" :recipe
			(:package "transient" :fetcher github :repo "magit/transient" :files
					  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					   "docs/*.texinfo"
					   (:exclude ".dir-locals.el" "test.el" "tests.el"
								 "*-test.el" "*-tests.el" "LICENSE" "README*"
								 "*-pkg.el"))
					  :source "MELPA" :id transient :type git :protocol https
					  :inherit t :depth treeless :ref
					  "318b039872a419feaf3ca3584e89936642627ca9"))
 (treemacs :source "elpaca-menu-lock-file" :recipe
		   (:package "treemacs" :fetcher github :repo
					 "Alexander-Miller/treemacs" :files
					 (:defaults "Changelog.org" "icons" "src/elisp/treemacs*.el"
								"src/scripts/treemacs*.py"
								(:exclude "src/extra/*"))
					 :source "MELPA" :id treemacs :type git :protocol https
					 :inherit t :depth treeless :ref
					 "2ab5a3c89fa01bbbd99de9b8986908b2bc5a7b49"))
 (undo-tree :source "elpaca-menu-lock-file" :recipe
			(:package "undo-tree" :repo
					  ("https://gitlab.com/tsc25/undo-tree" . "undo-tree") :tar
					  "0.8.2" :host gnu :files ("*" (:exclude ".git")) :source
					  "GNU ELPA" :id undo-tree :type git :protocol https
					  :inherit t :depth treeless :ref
					  "2bf5e230f1d11df7bbd9d8c722749e34482bc458"))
 (vertico :source "elpaca-menu-lock-file" :recipe
		  (:package "vertico" :repo "minad/vertico" :files
					(:defaults "extensions/*") :fetcher github :source "MELPA"
					:id vertico :type git :protocol https :inherit t :depth
					treeless :ref "c60d80215d19b4b36c0ba49599b6815ed35f2ac1"))
 (vertico-prescient :source "elpaca-menu-lock-file" :recipe
					(:package "vertico-prescient" :fetcher github :repo
							  "radian-software/prescient.el" :files
							  ("vertico-prescient.el") :source "MELPA" :id
							  vertico-prescient :type git :protocol https
							  :inherit t :depth treeless :ref
							  "ae52777d6b6b856b54c85441c7a713949f1720de"))
 (web-mode :source "elpaca-menu-lock-file" :recipe
		   (:package "web-mode" :repo "fxbois/web-mode" :fetcher github :files
					 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					  "docs/*.texinfo"
					  (:exclude ".dir-locals.el" "test.el" "tests.el"
								"*-test.el" "*-tests.el" "LICENSE" "README*"
								"*-pkg.el"))
					 :source "MELPA" :id web-mode :type git :protocol https
					 :inherit t :depth treeless :ref
					 "ce24723eb900c455b488d224910519bd36af580a"))
 (websocket :source "elpaca-menu-lock-file" :recipe
			(:package "websocket" :repo "ahyatt/emacs-websocket" :fetcher github
					  :files
					  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					   "docs/*.texinfo"
					   (:exclude ".dir-locals.el" "test.el" "tests.el"
								 "*-test.el" "*-tests.el" "LICENSE" "README*"
								 "*-pkg.el"))
					  :source "MELPA" :id websocket :type git :protocol https
					  :inherit t :depth treeless :ref
					  "7fb3686dd02aed5bd52bc847ef26a4346f149456"))
 (which-key :source "elpaca-menu-lock-file" :recipe
			(:package "which-key" :repo
					  ("https://github.com/emacs-mirror/emacs" . "which-key")
					  :tar "3.6.1" :host gnu :branch "master" :files
					  ("lisp/which-key.el" (:exclude ".git")) :source "GNU ELPA"
					  :id which-key :type git :protocol https :inherit t :depth
					  treeless :ref "0162ac9f06fe6c7452262d9056c8dc667517e86a"))
 (with-editor :source "elpaca-menu-lock-file" :recipe
			  (:package "with-editor" :fetcher github :repo "magit/with-editor"
						:files
						("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
						 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
						 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
						 "docs/*.texinfo"
						 (:exclude ".dir-locals.el" "test.el" "tests.el"
								   "*-test.el" "*-tests.el" "LICENSE" "README*"
								   "*-pkg.el"))
						:source "MELPA" :id with-editor :type git :protocol
						https :inherit t :depth treeless :ref
						"4d887efc750b7a69554dbd2d0c79ca447f8f08f3"))
 (yaml :source "elpaca-menu-lock-file" :recipe
	   (:package "yaml" :fetcher github :repo "zkry/yaml.el" :files
				 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo" "doc/dir"
				  "doc/*.info" "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
				  "docs/dir" "docs/*.info" "docs/*.texi" "docs/*.texinfo"
				  (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el"
							"*-tests.el" "LICENSE" "README*" "*-pkg.el"))
				 :source "MELPA" :id yaml :type git :protocol https :inherit t
				 :depth treeless :ref "5546f36bde24a9a8c1934e0f6ce205cd41d72537"))
 (yaml-mode :source "elpaca-menu-lock-file" :recipe
			(:package "yaml-mode" :repo "yoshiki/yaml-mode" :fetcher github
					  :files
					  ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
					   "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
					   "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
					   "docs/*.texinfo"
					   (:exclude ".dir-locals.el" "test.el" "tests.el"
								 "*-test.el" "*-tests.el" "LICENSE" "README*"
								 "*-pkg.el"))
					  :source "MELPA" :id yaml-mode :type git :protocol https
					  :inherit t :depth treeless :ref
					  "93dba98c050e9abfc623ec66aa499dbbb46b2fe1"))
 (yasnippet :source "elpaca-menu-lock-file" :recipe
			(:package "yasnippet" :fetcher github :repo "joaotavora/yasnippet"
					  :files (:defaults ("doc" "doc/*.org")) :source "MELPA" :id
					  yasnippet :type git :protocol https :inherit t :depth
					  treeless :ref "c1e6ff23e9af16b856c88dfaab9d3ad7b746ad37"))
 (yasnippet-snippets :source "elpaca-menu-lock-file" :recipe
					 (:package "yasnippet-snippets" :repo
							   "AndreaCrotti/yasnippet-snippets" :fetcher github
							   :files ("*.el" "snippets" ".nosearch") :source
							   "MELPA" :id yasnippet-snippets :type git
							   :protocol https :inherit t :depth treeless :ref
							   "606ee926df6839243098de6d71332a697518cb86")))
