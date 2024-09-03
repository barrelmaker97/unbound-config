# unbound-config
Unbound configuration files and install script

## Unbound Exporter
Optionally, a Prometheus Exporter for Unbound can be installed to monitor performance:
https://github.com/letsencrypt/unbound_exporter

## Exporter Service
To create a systemd service to automatically run unbound-exporter at startup, copy unbound-exporter.service from to /etc/systemd/system/ dir, make sure it is under the ownership of root, then enable and start the service.
```
sudo cp ./unbound-exporter.service /etc/systemd/system/
sudo chown root:root /etc/systemd/system/unbound-exporter.service
sudo systemctl enable unbound-exporter
sudo systemctl start unbound-exporter
sudo systemctl status unbound-exporter
```


# License

Copyright (c) 2024 Nolan Cooper

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
