mailcap:
```
text/html; sh -c "lynx -dump -force_html -assume_charset=utf-8 -display_charset=utf-8 '%s' | uniq | ~/.mutt/link-columns.pl"; copiousoutput; description=HTML Text; nametemplate=%s.html
```
