module Web::Controllers::Sessions
  class Create
    include Web::Action

    def call(params)
      team_info = auth_hash["extra"]["team_info"]["team"]
      team = Team.new access_token: auth_hash["credentials"]["token"],
        name: team_info["name"],
        team_id: team_info["id"]
      team = TeamRepository.create team

      bot_info = auth_hash["extra"]["bot_info"]
      bot = Bot.new access_token: bot_info["bot_access_token"],
        bot_id: bot_info["bot_user_id"],
        team_id: team.id
      bot = BotRepository.create bot

      user_info = auth_hash["extra"]["user_info"]["user"]
      player = Player.new username: user_info["name"],
        email: user_info["profile"]["email"],
        first_name: user_info["profile"]["first_name"],
        last_name: user_info["profile"]["last_name"],
        avatar_url: user_info["profile"]["image_192"],
        user_id: user_info["id"],
        team_id: team.id
      player = PlayerRepository.create player
      auto_login player

      redirect_to routes.bots_ready_path
    end

    private

    def auth_hash
      request.env["omniauth.auth"]
    end
  end
end
