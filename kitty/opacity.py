from kitty.boss import Boss

def main(args):
  return ''
  
from kittens.tui.handler import result_handler
@result_handler(no_ui=True)
def handle_result(args, answer, target_window_id, boss: Boss):

  current_opacity = boss.call_remote_control('get_window_opacity', [])

  new_opacity = 0.5 if current_opacity == 1 else 1

  boss.call_remote_control('set_opacity', [str(new_opacity)])
