/**
 * @method SimpleSchema.getEditableFields
 * Get a list of all fields editable by a specific user for a given schema
 * @param {Object} user – the user for which to check field permissions
 */
SimpleSchema.prototype.getEditableFields = function (user) {
  var schema = this._schema;
  var fields = _.sortBy(_.filter(_.keys(schema), function (fieldName) {
    var field = schema[fieldName];
    return Users.can.editField(user, field);
  }), function (fieldName) {
    var field = schema[fieldName];
    return field.autoform && field.autoform.order;
  });
  return fields;
};

SimpleSchema.prototype.getPublicFields = function () {
  var schema = this._schema;
  var fields = _.filter(_.keys(schema), function (fieldName) {
    var field = schema[fieldName];
    return !!field.public;
  });
  return fields;
};

SimpleSchema.prototype.getProfileFields = function () {
  var schema = this._schema;
  var fields = _.filter(_.keys(schema), function (fieldName) {
    var field = schema[fieldName];
    return !!field.profile;
  });
  return fields;
};