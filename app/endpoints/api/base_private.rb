module API
  class BasePrivate < Grape::API
    include API::BaseCommon
    mount API::Private::V1::Root
  end
end
