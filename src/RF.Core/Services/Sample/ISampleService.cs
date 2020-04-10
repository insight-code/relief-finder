using RF.Core.Entities;
using System.Threading.Tasks;

namespace RF.Core.Services.Sample
{
    public interface ISampleService
    {
        Task<SampleEntity> SayHelloAsync(string name);
    }
}