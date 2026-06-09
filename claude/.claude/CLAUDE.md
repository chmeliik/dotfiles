# Guidelines

## Git

- When committing:
  - Use the 'Assisted-by' trailer instead of 'Co-authored-by'
  - Add a 'Signed-off-by' trailer by using the -s flag
  - Keep it concise, include the necessary info but no fluff

## Documentation

- Keep it concise, include the necessary info but no fluff
- Use active voice, differentiate between actor roles
  (e.g. the contributor should ..., the maintainer will ..., the user can ...)
  - If the document is user-facing, don't use "the user", address the user directly
    or use "you"
- Try to keep lines under 80-90 characters
- Don't include a comma after "e.g."

### Markdown

- Don't use **bold text** as headings, use other Markdown elements to organize text
- Always leave an empty line around headings, lists, code blocks and other elements
- Include long URLs in a link table at the end, not inline

## Code

### Bash

- Start scripts with the following header (leave an empty line after):

  ```bash
  #!/bin/bash
  set -o errexit -o nounset -o pipefail
  ```

### GitHub Workflows

- Follow Bash guidelines, but omit the header if the script is trivial
- Don't use special workflow syntax (e.g. `${{ github.* }}`) inside `run:` scripts

## Tests

- Make tests as declarative as possible. It must be visible at first glance what
  the test does and what it checks.
- When checking error messages, make sure the expected strings are specific enough
  that we can be sure we're getting the expected error.
