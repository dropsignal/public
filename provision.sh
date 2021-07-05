#!/usr/bin/bash

if ! /usr/bin/grep --quiet '^ansible:' /etc/passwd ; then
  /usr/sbin/useradd --comment "Ansible service account" --uid 2000 ansible
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to create user ansible" ; exit 1 ; fi
fi

if [ ! -d /home/ansible ] ; then
  /usr/bin/mkdir /home/ansible
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to create directory /home/ansible" ; exit 1 ; fi
fi

if [ "$(/usr/bin/stat --format='%a' /home/ansible)" != "700" ] ; then
  /usr/bin/chmod 700 /home/ansible
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to change permissions of /home/ansible to 700" ; exit 1 ; fi
fi

if [ "$(/usr/bin/stat --format='%U' /home/ansible)" != "ansible" ] ; then
  /usr/bin/chown ansible /home/ansible
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to change owner of /home/ansible to ansible" ; exit 1 ; fi
fi

if [ "$(/usr/bin/stat --format='%G' /home/ansible)" != "ansible" ] ; then
  /usr/bin/chgrp ansible /home/ansible
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to change group of /home/ansible to ansible" ; exit 1 ; fi
fi

if [ ! -d /home/ansible/.ssh ] ; then
  /usr/bin/mkdir /home/ansible/.ssh
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to create directory /home/ansible/.ssh" ; exit 1 ; fi
fi

if [ "$(/usr/bin/stat --format='%a' /home/ansible/.ssh)" != "700" ] ; then
  /usr/bin/chmod 700 /home/ansible/.ssh
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to change permissions of /home/ansible/.ssh to 700" ; exit 1 ; fi
fi

if [ "$(/usr/bin/stat --format='%U' /home/ansible/.ssh)" != "ansible" ] ; then
  /usr/bin/chown ansible /home/ansible/.ssh
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to change owner of /home/ansible/.ssh to ansible" ; exit 1 ; fi
fi

if [ "$(/usr/bin/stat --format='%G' /home/ansible/.ssh)" != "ansible" ] ; then
  /usr/bin/chgrp ansible /home/ansible/.ssh
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to change group of /home/ansible/.ssh to ansible" ; exit 1 ; fi
fi

if [ ! -f /home/ansible/.ssh/authorized_keys ] ; then
  /usr/bin/touch /home/ansible/.ssh/authorized_keys
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to create file /home/ansible/.ssh/authorized_keys" ; exit 1 ; fi
fi

if [ "$(/usr/bin/stat --format='%a' /home/ansible/.ssh/authorized_keys)" != "600" ] ; then
  /usr/bin/chmod 600 /home/ansible/.ssh/authorized_keys
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to change permissions of /home/ansible/.ssh/authorized_keys to 600" ; exit 1 ; fi
fi

if [ "$(/usr/bin/stat --format='%U' /home/ansible/.ssh/authorized_keys)" != "ansible" ] ; then
  /usr/bin/chown ansible /home/ansible/.ssh/authorized_keys
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to change owner of /home/ansible/.ssh/authorized_keys to ansible" ; exit 1 ; fi
fi

if [ "$(/usr/bin/stat --format='%G' /home/ansible/.ssh/authorized_keys)" != "ansible" ] ; then
  /usr/bin/chgrp ansible /home/ansible/.ssh/authorized_keys
  if [ $? -ne 0 ] ; then /usr/bin/echo "error: failed to change group of /home/ansible/.ssh/authorized_keys to ansible" ; exit 1 ; fi
fi

/usr/bin/sed --in-place '/AAAAB3NzaC1yc2EAAAABJQAAAgEAowfxU6aIE582No8PGZ9S43Ibnv5x3gaQKXGVcYkZs\/oRh1dAPcuuPdHSB50Lz\/Og3iEFi2Bz9vJF4CXXO3iRIC9PHvTluBWUakMN3O9CYE7I8b8i0WxM+GSnxl2wiPReu2mgjI7Y+7JSCw4hyV4KUJnr1m2+1UvWkybixm\/Gdab5BJRbE1WF+QSUr9LH5qoqDg2ilFrBPg10rA2L8l42B\/pEASVXX1OPCukGRxqgYz5GHzALf8Ef\/QUtUx4nVIPNX7A4xwGy7jL+jI17azXZFp\/ZUamWaRVU8HrrLI8+pOHwWR2QcsBqd\/\/9F9Uvlht3LjbFnbz+daT1VzzfuyfXRV1g3uFatKhxYsUGtGq4dVfKEhOXml9h0hCah6nORb0JBuVLOr7Jw15+veUdVpza\/MKHJJbEMtyFtEkjaZQ9Ne4LaWKsB4XiXqc0SeTBqWcES0yD8RuucMqca\/3yZ\/E8tjtdIyqW0QToeadILM\/JG0NIjr9PsPYAtq1xDgdTqhwYVOj51oxYoQeWYXogCEr62YH+\/aOqwxVGQZAA+fJrLIUMl9t\/mRR84uLTQsR96vb9BQqYX1APVdk3ti6cqX5ftzWl6m3CeYF0m1xs5dMWegsyG+ePbNpFYk7VBE9rM8WaDXIeZhGZp8z3v68yik7CNfBM59xaEEamzWRYEfFKETE=/d' /home/ansible/.ssh/authorized_keys
/usr/bin/echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAowfxU6aIE582No8PGZ9S43Ibnv5x3gaQKXGVcYkZs/oRh1dAPcuuPdHSB50Lz/Og3iEFi2Bz9vJF4CXXO3iRIC9PHvTluBWUakMN3O9CYE7I8b8i0WxM+GSnxl2wiPReu2mgjI7Y+7JSCw4hyV4KUJnr1m2+1UvWkybixm/Gdab5BJRbE1WF+QSUr9LH5qoqDg2ilFrBPg10rA2L8l42B/pEASVXX1OPCukGRxqgYz5GHzALf8Ef/QUtUx4nVIPNX7A4xwGy7jL+jI17azXZFp/ZUamWaRVU8HrrLI8+pOHwWR2QcsBqd//9F9Uvlht3LjbFnbz+daT1VzzfuyfXRV1g3uFatKhxYsUGtGq4dVfKEhOXml9h0hCah6nORb0JBuVLOr7Jw15+veUdVpza/MKHJJbEMtyFtEkjaZQ9Ne4LaWKsB4XiXqc0SeTBqWcES0yD8RuucMqca/3yZ/E8tjtdIyqW0QToeadILM/JG0NIjr9PsPYAtq1xDgdTqhwYVOj51oxYoQeWYXogCEr62YH+/aOqwxVGQZAA+fJrLIUMl9t/mRR84uLTQsR96vb9BQqYX1APVdk3ti6cqX5ftzWl6m3CeYF0m1xs5dMWegsyG+ePbNpFYk7VBE9rM8WaDXIeZhGZp8z3v68yik7CNfBM59xaEEamzWRYEfFKETE= ansible@dropsignal.com' >>/home/ansible/.ssh/authorized_keys

ansible ALL=(ALL) NOPASSWD: ALL
