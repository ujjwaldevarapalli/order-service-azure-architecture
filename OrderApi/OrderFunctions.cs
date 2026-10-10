using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;
using System.Net;

namespace OrderApi
{
    public static class OrderFunctions
    {
        [Function("CreateOrder")]
        public static async Task<HttpResponseData> CreateOrder(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "orders")] HttpRequestData req,
            FunctionContext context)
        {
            var logger = context.GetLogger("CreateOrder");
            logger.LogInformation("Received create order request.");
            // Placeholder: Parse body and create order.
            var response = req.CreateResponse(HttpStatusCode.Created);
            await response.WriteStringAsync("Order created (mock).", context.CancellationToken);
            return response;
        }

        [Function("GetOrder")]
        public static async Task<HttpResponseData> GetOrder(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "orders/{id}")] HttpRequestData req,
            string id,
            FunctionContext context)
        {
            var logger = context.GetLogger("GetOrder");
            logger.LogInformation($"Fetching order {id}.");
            // Placeholder: Fetch order by id
            var response = req.CreateResponse(HttpStatusCode.OK);
            await response.WriteStringAsync($"Order {id} details (mock).", context.CancellationToken);
            return response;
        }

        [Function("UpdateOrder")]
        public static async Task<HttpResponseData> UpdateOrder(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "orders/{id}")] HttpRequestData req,
            string id,
            FunctionContext context)
        {
            var logger = context.GetLogger("UpdateOrder");
            logger.LogInformation($"Updating order {id}.");
            // Placeholder: Update order
            var response = req.CreateResponse(HttpStatusCode.OK);
            await response.WriteStringAsync($"Order {id} updated (mock).", context.CancellationToken);
            return response;
        }

        [Function("DeleteOrder")]
        public static async Task<HttpResponseData> DeleteOrder(
            [HttpTrigger(AuthorizationLevel.Function, "delete", Route = "orders/{id}")] HttpRequestData req,
            string id,
            FunctionContext context)
        {
            var logger = context.GetLogger("DeleteOrder");
            logger.LogInformation($"Deleting order {id}.");
            // Placeholder: Delete order
            var response = req.CreateResponse(HttpStatusCode.NoContent);
            return response;
        }
    }
}
