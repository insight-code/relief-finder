using MediatR;
using RF.Core.Entities;

namespace RF.Handlers.Messages.Sample
{
    public class GetSampleMessage : IRequest<SampleEntity>
    {
        public string Name { get; set; }
    }
}
