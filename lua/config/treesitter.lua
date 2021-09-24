require 'nvim-treesitter.configs'.setup
	{ ensure_installed =
		{ 'bash'
		, 'lua'
		, 'html'
		, 'css'
		, 'scss'
		, 'typescript'
		, 'javascript'
		, 'python'
		}
	, highlight =
		{ enable = true
		, use_languagetree = true
		}
	}
