require('lspconfig').verible.setup{
  cmd = {'verible-verilog-ls', '--rules=-no-tabs,-always-comb,-banned-declared-name-patterns,-no-trailing-spaces,-explicit-parameter-storage-type,-unpacked-dimensions-range-ordering'},
}
