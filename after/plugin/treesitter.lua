local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify('Module treesitter not found')
  return
end



configs.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "vimdoc", "c", "javascript", "typescript", "lua", "vimdoc", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable_virtual_text = true,
    disable = { "html" }, -- optional, list of language that will be disabled
    -- include_match_words = false
  },
  
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
