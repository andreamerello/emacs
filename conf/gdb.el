
; --------- GDB/ openocd related

(defun my-gdb-host ()
  (interactive)
  (setq gud-gdb-command-name "gdb -i=mi")
  (message "gdb for host programs")
)

(defun my-gdb-openocd-arm ()
  (interactive)
  (setq gud-gdb-command-name "arm-none-eabi-gdb -i=mi -x openocd.gdb")
  (message "gdb for ARM/openocd")
)

