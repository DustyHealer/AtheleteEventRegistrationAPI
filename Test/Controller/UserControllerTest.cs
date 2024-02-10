using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Test.InfraSetup;
using Xunit;
using UserAPI;
using UserAPI.Models;

namespace Test.Controller
{
    [Collection("Auth API")]
    [TestCaseOrderer("Test.PriorityOrderer", "Test")]
    public class UserControllerTest
    {
        private readonly HttpClient _client;

        public UserControllerTest(UserWebApplicationFactory<Startup> factory)
        {
            _client = factory.CreateClient();
        }

        #region positivetests
        [Fact, TestPriority(1)]
        public async Task RegisterUserShouldSuccess()
        {
            User user = new User {Username = "Sachin", Password = "admin123", ConfirmPassword= "admin123" };

            HttpRequestMessage request = new HttpRequestMessage();
            MediaTypeFormatter formatter = new JsonMediaTypeFormatter();

            // The endpoint or route of the controller action.
            var httpResponse = await _client.PostAsync<User>("/api/user/register", user, formatter);

            // Deserialize and examine results.
            var stringResponse = await httpResponse.Content.ReadAsStringAsync();
            //var response = JsonConvert.DeserializeObject<User>(stringResponse);
            Assert.Equal(HttpStatusCode.OK, httpResponse.StatusCode);
            Assert.True(true);
        }

        [Fact, TestPriority(2)]
        public async Task LoginUserShouldSuccess()
        {
            User user = new User { Username = "Sachin", Password = "admin123" };

            HttpRequestMessage request = new HttpRequestMessage();
            MediaTypeFormatter formatter = new JsonMediaTypeFormatter();

            // The endpoint or route of the controller action.
            var httpResponse = await _client.PostAsync<User>("/api/user/login", user, formatter);

            // Deserialize and examine results.
            var stringResponse = await httpResponse.Content.ReadAsStringAsync();
            Assert.Equal(HttpStatusCode.OK, httpResponse.StatusCode);
            Assert.True(stringResponse.Length > 0);
        }
        #endregion positivetests

        #region negativetests
        [Fact, TestPriority(3)]
        public async Task RegisterUserShouldFail()
        {
            User user = new User { Username = "Mukesh", Password = "admin123" };

            HttpRequestMessage request = new HttpRequestMessage();
            MediaTypeFormatter formatter = new JsonMediaTypeFormatter();

            // The endpoint or route of the controller action.
            var httpResponse = await _client.PostAsync<User>("/api/user/register", user, formatter);

            // Deserialize and examine results.
            var stringResponse = await httpResponse.Content.ReadAsStringAsync();
            Assert.Equal(HttpStatusCode.BadRequest, httpResponse.StatusCode);
        }

        [Fact, TestPriority(4)]
        public async Task LoginUserShouldFail()
        {
            User user = new User { Username = "John", Password = "admin123" };

            HttpRequestMessage request = new HttpRequestMessage();
            MediaTypeFormatter formatter = new JsonMediaTypeFormatter();

            // The endpoint or route of the controller action.
            var httpResponse = await _client.PostAsync<User>("/api/user/login", user, formatter);

            // Deserialize and examine results.
            var stringResponse = await httpResponse.Content.ReadAsStringAsync();
            Assert.Equal(HttpStatusCode.NotFound, httpResponse.StatusCode);
        }

        #endregion negativetests
    }
}
