return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort
			},
		})

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.py" },
      callback = function()
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
        })
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.html", "*.css", "*.js", "*.ts" },
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })


		vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
      })
    end)
	end,
}
