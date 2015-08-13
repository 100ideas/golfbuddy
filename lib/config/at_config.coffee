
#  Options
AccountsTemplates.configure 
  defaultTemplate: 'customFullPageAtForm' #overrive 'fullPageAtForm' default
  defaultLayout: 'masterLayout'
  defaultLayoutRegions: {
    top: "landingNav"
  } # i.e. templates in the layout
  defaultContentRegion: 'main' # should be name of variable of main dynamic template
  showForgotPasswordLink: true
  overrideLoginErrors: true
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

# Routes
AccountsTemplates.configureRoute 'changePwd'
AccountsTemplates.configureRoute 'forgotPwd'
AccountsTemplates.configureRoute 'resetPwd'
AccountsTemplates.configureRoute 'signIn',
AccountsTemplates.configureRoute 'signUp'
AccountsTemplates.configureRoute 'verifyEmail'
