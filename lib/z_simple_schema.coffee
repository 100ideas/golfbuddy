# @Users = Meteor.users

# SimpleSchema.prototype.getEditableFields = (user) ->
#   schema = this._schema
#   _.sortBy(
#     _.filter(_.keys(schema), (fieldName) ->
#       Users.can.editField user, schema[fieldName]),
#       (fieldName) ->
#         schema[fieldName].autoform?.order
# )

# SimpleSchema.prototype.getEditableFields = function (user) {
#   var schema = this._schema;
#   var fields = _.sortBy(_.filter(_.keys(schema), function (fieldName) 
#     var field = schema[fieldName];
#     return Users.can.editField(user, field);
#   }), function (fieldName) {
#     var field = schema[fieldName];
#     return field.autoform && field.autoform.order;
#   });
#   return fields;
# };

# SimpleSchema.prototype.getPublicFields = function () {
#   var schema = this._schema;
#   var fields = _.filter(_.keys(schema), function (fieldName) {
#     var field = schema[fieldName];
#     return !!field.public;
#   });
#   return fields;
# };

# SimpleSchema.prototype.getProfileFields = function () {
#   var schema = this._schema;
#   var fields = _.filter(_.keys(schema), function (fieldName) {
#     var field = schema[fieldName];
#     return !!field.profile;
#   });
#   return fields;
# };