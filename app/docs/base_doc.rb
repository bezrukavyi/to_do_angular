module BaseDoc
  include Apipie::DSL::Concern

  def resource(resource)
    @namespace = self.to_s.deconstantize
    @controller_name = "#{@namespace}::#{resource.to_s.camelize}Controller"
    Apipie.app.set_resource_id(self, @controller_name)
  end

  def doc_for(action_name, &block)
    instance_eval(&block)
    api_version @namespace.demodulize.downcase
    define_method(action_name) do; end
  end
end
