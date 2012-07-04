require 'resque'

module DelayedPaperclip
  module Jobs
    class Resque
      @queue = :paperclip

      def self.enqueue_delayed_paperclip(instance_klass, instance_id, attachment_name, styles_to_reprocess = [])
        ::Resque.enqueue(self, instance_klass, instance_id, attachment_name, styles_to_reprocess)
      end

      def self.perform(instance_klass, instance_id, attachment_name, styles_to_reprocess = [])
        DelayedPaperclip.process_job(instance_klass, instance_id, attachment_name, styles_to_reprocess)
      end
    end
  end
end
