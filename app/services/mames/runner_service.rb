module Mames
  class RunnerService
    def initialize(opts = {})
      @command = opts[:command]
      @args = opts[:args]
    end

    def call
      run_command
    end

    private
    def run_command
      if @command == 'new'
        create_mame
      elsif @command == 'delete'
        find_mame_and_delete
      elsif @command == 'get'
        get_mames_by_author
      elsif @command = 'score'
        get_scores
      end
    end

    def create_mame
      @args = @args.split
      text = @args[0..-2].join ' '
      author = @args[-1]
      mame = Mame.create(text: text, author: author)
      mame.present? ? mame.quote : 'Mame no creado'
    end

    def find_mame_and_delete
      mame_id = @args
      mame = Mame.find_by(id: mame_id)
      if mame.present?
        mame.destroy ? 'Mame eliminado' : 'Mame no pudo ser eliminado'
      else
        'Mame no encontrado'
      end
    end

    def get_mames_by_author
      author = @args[0..-1]
      if author.blank?
        Mame.all
      else
        Mame.where(author: author).all
      end
    end

    def get_scores
      scores = {}
      relation = unless @args.blank?
        Mame.select("mames.author, count(id) as count").group(:author).where(author: @args)
      else
        Mame.select("mames.author, count(id) as count").group(:author)
      end

      relation.collect do |record|
        scores["#{record.author}"] = record.count
      end
      scores
    end
  end
end
