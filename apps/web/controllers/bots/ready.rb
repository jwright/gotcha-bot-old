module Web::Controllers::Bots
  class Ready
    include Web::Action
    before :authenticate!

    expose :team

    def call(params)
      @team = TeamRepository.find current_user.team_id
    end

    private

    def authenticate!
      require_login do
        redirect_to routes.signup_path
      end
    end
  end
end
