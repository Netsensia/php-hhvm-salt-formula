nginx:
  pkg:
    - installed
    
nginx-restart:
  module:
    - wait
    - name: service.restart
    - m_name: nginx