# extend SimpleSchema with custom options
# https://github.com/aldeed/meteor-simple-schema#extending-the-schema-options
# https://github.com/TelescopeJS/Telescope/blob/master/packages/telescope-lib/lib/base.js
# https://github.com/TelescopeJS/Telescope/blob/master/packages/telescope-lib/lib/collections.js
#
# see core.js
SimpleSchema.extendOptions 
  editableBy: Match.Optional [String]
  public: Match.Optional(Boolean), # public: true means the field is published freely
  profile: Match.Optional(Boolean), # profile: true means the field is shown on user profiles

@Schema = {}