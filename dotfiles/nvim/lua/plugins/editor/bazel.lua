-- Bazel support (vim-bazel)
-- Provides :Bazel command for running targets with quickfix integration
vim.g.bazel_bash_completion = 1

vim.keymap.set("n", "<leader>bb", "<cmd>Bazel build //...<cr>", { desc = "Bazel build all" })
vim.keymap.set("n", "<leader>bt", "<cmd>Bazel test //...<cr>", { desc = "Bazel test all" })
