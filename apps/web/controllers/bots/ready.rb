module Web::Controllers::Bots
  class Ready
    include Web::Action

    expose :team

    def call(params)
      @team = TeamRepository.find current_user.team_id
    end
  end
end
