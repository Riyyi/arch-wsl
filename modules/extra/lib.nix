{ lib, rootPath, ... }:
{

  _module.args.dot = {

    # Calculate the subdirectory directory from root the calling module is in
    subDir =
      curPos: # call with __curPos
      let
        modDir = dirOf curPos.file;
      in
      lib.strings.removePrefix (toString rootPath + "/") (toString modDir);

  };

}
