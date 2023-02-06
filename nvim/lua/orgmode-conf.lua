require('orgmode').setup_ts_grammar()

require('orgmode').setup({
  org_agenda_files = { '~/riiid/**/*' },
  org_default_notes_file = '~/riiid/org/refile.org',
})
