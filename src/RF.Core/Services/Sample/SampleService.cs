using RF.Core.Entities;
using System.Threading.Tasks;

namespace RF.Core.Services.Sample
{
    public class SampleService : ISampleService
    {
        public async Task<SampleEntity> SayHelloAsync(string name)
        {
            var result = new SampleEntity { Message = $"Hello, {name}" };
            return await Task.FromResult(result);
        }
    }
}
