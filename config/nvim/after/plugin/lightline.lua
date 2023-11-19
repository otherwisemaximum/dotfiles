vim.cmd([[
    let g:lightline = {
    \       'colorscheme': 'darcula',
    \		'active': {
    \			'left': [ ['mode', 'paste'],
    \					[ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \			]
    \		}
    \}
]])

