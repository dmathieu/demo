module SinatraRails
  def self.included(klass)
    klass.class_eval do
      def default_url_options
        { :host => request.host_with_port }
      end
      def controller
        'sinatra'
      end
    end
  end
end