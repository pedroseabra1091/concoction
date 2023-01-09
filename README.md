## Content
- Static analysis with [Credo](https://github.com/rrrene/credo)
- Docker development environment
- Releases using [mix release](https://hexdocs.pm/mix/Mix.Tasks.Release.html)
- Dependabot for dependency bumps
- Integration with Tailwind
- [TODO] Improve setup scripts
- [TODO] CI integration with CircleCI
- [TODO] Security scanning with [Mix Audit](https://hex.pm/packages/mix_audit) and [Sobelow](https://hexdocs.pm/sobelow/readme.html)
- [TODO] Healthcheck setup with [plug_checkup](https://hexdocs.pm/plug_checkup/api-reference.html)
- [MAYBE] Server-side rendered React components using [Remount](https://github.com/rstacruz/remount)
- [MAYBE] Server-side rendered Surface components using [Surface](https://github.com/surface-ui/surface)

## Brew your own concoction
1. Clone this project – `git clone https://github.com/pedroseabra1091/concoction.git`
2. Delete the internal Git directory – `rm -rf .git`
2. Install all the hard requirements – `bin/install`
3. Run the setup script – `bin/concoction <your_project_name>`
4. Create a new repo – `git init`
5. Commit those changes – `git commit -m "Initial commit"`