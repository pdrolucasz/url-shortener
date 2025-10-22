module Api
    class LinksController < ApplicationController
    include Base62Converter
    before_action :set_link, only: %i[ destroy ]

    def index
        @links = Link.all()
        render json: @links.to_json()
    end

    def create
        original_url = link_params[:original_url]
        short_code_hash = Digest::SHA256.hexdigest link_params[:original_url]
        short_code_hash_integer = short_code_hash.to_i(16)
        unique_short_code = short_code_hash_integer / Time.now.to_i()
        short_code = Base62Converter.encode(unique_short_code).slice(0..8)

        @link = Link.create({
            short_code: short_code,
            original_url: original_url,
            short_url: ENV["DOMAIN"] + short_code
        })

        render json: @link.to_json()
    end

    def destroy
        @link.destroy()
    end

    private
        def set_link
            @link = Link.find(params[:id])
        end
        def link_params
            params.expect(link: [ :original_url, :expiration_date ])
        end
    end
end
