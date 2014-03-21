## 0.10
- add require_accessor on model
- extract simple_nav to fume-nav gem
- remove app_setting_loader, use fume-settable instead of it.
- remove action_attr_accessor
- remove simple_scaffold generator
- remove hashie gem depend
- refactor code structure

## 0.9
 - extract cancan to standalone gem
 - remove authlogic ext

## 0.8
 - don't depends all rails plugin, you must depend it for yourself. 
 - upgrade rails to 3.1.0

## 0.7
 - add action_attr_accessor method
 - depend rails_i18n
 - rename simple\_theme to simple_nav and rewirte
 - auto require config/application.*.rb
 - add render cache feature