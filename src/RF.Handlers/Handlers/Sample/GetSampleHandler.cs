using MediatR;
using Microsoft.Extensions.Logging;
using RF.Core.Entities;
using RF.Core.Services.Sample;
using RF.Handlers.Messages.Sample;
using System.Threading;
using System.Threading.Tasks;

namespace RF.Handlers.Handlers.Sample
{
    public class GetSampleHandler : IRequestHandler<GetSampleMessage, SampleEntity>, IGetSampleHandler
    {
        private readonly ISampleService _service;
        private readonly ILogger _logger;

        public GetSampleHandler(ISampleService service, ILogger<GetSampleHandler> logger)
        {
            _service = service;
            _logger = logger;
        }

        public async Task<SampleEntity> Handle(GetSampleMessage request, CancellationToken cancellationToken)
        {
            _logger.LogDebug("Begin - {Class}.{Func}", nameof(GetSampleHandler), nameof(Handle));
            
            var result = await _service.SayHelloAsync(request.Name);
            
            _logger.LogDebug("End - {Class}.{Func}", nameof(GetSampleHandler), nameof(Handle));
            return result;
        }
    }
}
