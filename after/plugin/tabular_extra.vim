""
"" Tabular
""

if exists('g:tabular_loaded')
  AddTabularPattern! symbols         / :/l0
  AddTabularPattern! hash            /^[^>]*\zs=>/
  AddTabularPattern! chunks          / \S\+/l0
  AddTabularPattern! assignment      /^[^=|(^+=)]*/
  AddTabularPattern! comma           /^[^,]*,/l1
  AddTabularPattern! colon           /:\zs /l0
  AddTabularPattern! options_hashes  /:\w\+ =>/
endif

