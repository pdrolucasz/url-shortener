class RedirectController < ApplicationController
    def show
        @original_link = Link.find_by(short_code: params[:short_code])
        @link_metric = @original_link.link_metrics.create({
            ip_address: request.remote_ip,
            user_agent: request.user_agent,
            access_in: Time.now() # CUIDADO!!!
        })

        redirect_to @original_link.original_url, allow_other_host: true
    end
end
