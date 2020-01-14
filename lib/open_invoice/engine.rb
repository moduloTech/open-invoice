# frozen_string_literal: true

module OpenInvoice

  # Author: varaby_m@modulotech.fr
  # openinvoice rails engine entry
  class Engine < ::Rails::Engine

    isolate_namespace OpenInvoice

    # add initializer for assets precompile
    initializer 'open_invoice.assets.precompile' do |app|
      app.config.assets.paths << root.join('node_modules')
      app.config.assets.precompile += %w[open_invoice/application.css open_invoice/application.js]
    end

    # allow to respond to :pdf
    initializer 'open_invoice.mime_types' do
      Mime::Type.register 'application/pdf', :pdf
    end

  end

end
