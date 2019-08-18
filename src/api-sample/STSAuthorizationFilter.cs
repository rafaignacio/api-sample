using System.Net.Http;
using Microsoft.AspNetCore.Mvc.Filters;

namespace api_sample.Filters
{
    public class STSAuthorizationFilter : IAuthorizationFilter
    {
        private IHttpClientFactory _client_factory;

        public STSAuthorizationFilter(IHttpClientFactory clientFactory)
        {
            _client_factory = clientFactory;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            throw new System.NotImplementedException();
        }
    }
}