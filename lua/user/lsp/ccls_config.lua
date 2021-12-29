local lspconfig = require'lspconfig'
lspconfig.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "";
    rootPatterns = {"compile_commands.json", ".ccls"};
    cache = {
        directory = "/home/awalder/.cache/ccls"
    };
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}


