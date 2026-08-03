return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.1",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>pgf', builtin.git_files, {})
    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function pick_path_into_buffer()
      builtin.find_files({
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            local entry = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if entry then
              vim.api.nvim_put({ entry.value or entry[1] }, "", false, true)
            end
          end)
          return true
        end,
      })
    end

    vim.keymap.set({ "n", "i" }, "<leader>ip", pick_path_into_buffer, { desc = "Insert file path" })
  end
}
