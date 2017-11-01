// Function for adding authorization to the header from the 'explore' form at the top
const addApiKeyAuthorization = function() {
  const key = $("#input_apiKey")[0].value;
  if (key && (key.trim() !== "")) {
    log(`added key ${key}`);
    window.authorizations.add("oauth2", new ApiKeyAuthorization("Authorization", `Bearer ${key}`, "header"));
  }
};

const initializeAccessTokenForm = function() {
  // On api key change, store the API key in localstorage
  $("#input_apiKey").change(function() {
    addApiKeyAuthorization();
    return localStorage.setItem('access_token', $('#input_apiKey').val());
  });

  // Set up headroom - floating header
  $('#header').headroom();

  // Set the token from the parameters (used when redirecting from OAuth)
  const param_token = window.location.href.match(/access_token=[^#|\/]*/i);
  if ((param_token != null) && (param_token.length > 0)) {
    return $("#input_apiKey").val(param_token[0].replace('access_token=', '')).change();
  }
};

const initializeApplicationList = function() {
  // Manage scopes and the parameters
  $('.newtoken-scope-check').change(function(e) {
    const app = $(e.target).parents('.application_list_box');
    const link = app.find('.authorize_new_token_link');
    const checked = app.find('.newtoken-scope-check input:checked');
    const scopes = [];
    for (let s of Array.from(checked)) { scopes.push($(s).attr('id')); }
    let url = link.attr('data-base');
    if (scopes.length > 0) { url = `${url}&scope=${scopes.join('+')}`; }
    return link.attr('href', url).text(url);
  });

  // In application list, on "use token", show the header, set the token
  $('.set-token').click(function(e) {
    e.preventDefault();
    $('#header').addClass('headroom--pinned').removeClass('headroom--unpinned');
    const input_key = $("#input_apiKey");
    return input_key.fadeOut('fast', function() {
      input_key.val($(e.target).attr('data-token')).change();
      return input_key.fadeIn('fast');
    });
  });

  // Slide toggle applications in list
  $('.listed-app-name').click(function(e) {
    e.preventDefault();
    const target = $(e.target);
    target.parents('li').find('.application-info').slideToggle('fast');
    return target.toggleClass('uncollapsed');
  });

  // Add token from application
  return $('.add-token-form-btn').click(function(e) {
    e.preventDefault();
    const app = $(e.target).parents('.application_list_box');
    const app_id = app.attr('data-id');
    return app.find('.add-token-form, .add-token-form-btn').slideToggle();
  });
};

$(function() {
  const url = `${window.base_url}/api/private/${window.api_version}/swagger_doc`;
  window.swaggerUi = new SwaggerUi({
    url,
    dom_id: "swagger-ui-container",
    supportedSubmitMethods: [
      "get",
      "post",
      "put",
      "delete"
    ],
    onComplete(swaggerApi, swaggerUi) {
      // Try to load the token from local storage
      const token = localStorage.getItem('access_token');
      if ((token != null) && (token.length > 0)) {
        // If token exists, change
        $("#input_apiKey").val(token).change();
      }

      $("pre code").each(function(i, e) {
        hljs.highlightBlock(e);
      });

    },

    onFailure(data) {
      log("Unable to Load SwaggerUI");
    },

    docExpansion: "none",
    sorter: "alpha"
  });

  window.swaggerUi.load();

  initializeAccessTokenForm();
  return initializeApplicationList();
});
