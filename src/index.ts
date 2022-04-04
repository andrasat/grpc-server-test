import { Service } from 'base-microservice-core/lib/external'

const service = new Service('local-service', undefined, 'development', true)

service.registerListener('getMessage', () => {
  return new Promise(resolve => {
    const waitingTime = Math.min(Math.random() * 1000, 1000)

    setTimeout(() => resolve({
      status: 'OK',
      data: {
        message: 'This is a message'
      }
    }), waitingTime)
  })
})
