require('orgmode').setup_ts_grammar()

require('orgmode').setup({
  org_agenda_files = { '~/orgmode/*.org' },
  org_default_notes_file = '~/orgmode/todo.org',
  org_agenda_start_on_weekday = 7,
})