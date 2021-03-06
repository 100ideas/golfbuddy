
#  Options
AccountsTemplates.configure 
  defaultTemplate: 'customFullPageAtForm' #overrive 'fullPageAtForm' default
  defaultLayout: 'landingLayout'
  defaultLayoutRegions: {
    top: "landingNav"
    bottom: {}
  } # i.e. templates in the layout
  defaultContentRegion: 'main' # should be name of variable of main dynamic template
  showForgotPasswordLink: true
  overrideLoginErrors: false
  enablePasswordChange: true
  # hideSignUpLink: true,

  # sendVerificationEmail: true,
  # enforceEmailVerification: true,
  # confirmPassword: true,
  # continuousValidation: false,
  # displayFormLabels: true,
  # forbidClientAccountCreation: true,
  # formValidationFeedback: true,
  homeRoutePath: '/'
  # showAddRemoveServices: false,
  # showPlaceholders: true,

  negativeValidation: true
  positiveValidation: true
  negativeFeedback: false
  positiveFeedback: false

  #  Privacy Policy and Terms of Use
  # privacyUrl: 'privacy',
  # termsUrl: 'terms-of-use',

  # Hooks
  onLogoutHook: ->
    FlowRouter.reload()
    Materialize.toast "See you again soon!" , 5000, 'lime grey-text text-darken-4'

# Routes
AccountsTemplates.configureRoute 'changePwd'
AccountsTemplates.configureRoute 'forgotPwd'
AccountsTemplates.configureRoute 'resetPwd'
AccountsTemplates.configureRoute 'signIn'
AccountsTemplates.configureRoute 'signUp',
  redirect: "/users/profile/edit"
AccountsTemplates.configureRoute 'verifyEmail'


AccountsTemplates.addField
  _id: 'username',
  type: 'text',
  required: true,
  minLength: 2;
  maxLength: 15;
  displayName: 'username',
  re: /^[a-z0-9A-Z_]{3,15}$/,
  # func: (e) -> "Full Name" is e,
  errStr: 'Just a simple nickname, buddy!',
  trim: true