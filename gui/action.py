"""Defines actions which functions can return to denote how the handler should proceed."""

import util

CONTINUE = 0
PAUSE = 1
GO_BACK = 2
EXIT = 3


def process_action(action) -> bool:
    if action == CONTINUE:
        return False
    if action == PAUSE:
        util.pause()
        return False
    if action == GO_BACK:
        return True
    if action == EXIT:
        exit(0)
        return True
