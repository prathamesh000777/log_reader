class LogsController < ApplicationController
  CHUNK_SIZE = 30
  def broadcast
    buf = $log_file_descriptor.read(CHUNK_SIZE)
    if buf.nil?
      puts "No new lines added yet"
      head :ok
      return
    end
    ActionCable.server.broadcast 'logs',
    logs: buf
    head :ok
  end
end
