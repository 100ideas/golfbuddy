# Thanks telescope
# https://github.com/TelescopeJS/Telescope/blob/master/packages/telescope-users/lib/roles.js

Users.is = {}

Users.is.admin = (userOrUserId) ->
  try
    user = Users.getUser userOrUserId
    !!user and !!user.isAdmin
  catch e
    return false; # user not logged in

Users.is.owner = (userOrUserId, document) ->
  try
    user = Users.getUser userOrUserId
    if !!document.userId
       # case 1: document is a post or a comment, use userId to check
      user._id is document.userId;
    else
       # case 2: document is a user, use _id to check
      user._id is document._id;
  catch e
    return false; # user not logged in

# Meteor.users.helpers
#   isOwner: (document) ->
#     Users.is.owner this, document