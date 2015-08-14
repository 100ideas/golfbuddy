
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
  overrideLoginErrors: true
  enablePasswordChange: true
  overrideLoginErrors: false
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
AccountsTemplates.configureRoute 'signIn',
AccountsTemplates.configureRoute 'signUp'
AccountsTemplates.configureRoute 'verifyEmail'


AccountsTemplates.addField
  _id: 'name',
  type: 'text',
  required: true,
  minLength: 2;
  maxLength: 30;
  displayName: 'Nickname',
  re: /^[a-z ,.'-]+$/,
  # func: (e) -> "Full Name" is e,
  errStr: 'Only "Full Name" allowed!',
  trim: true