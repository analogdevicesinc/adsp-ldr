project('adsp-ldr', 'c',
  version : run_command(
    ['utils/version.sh', 'get-vcs'],
    check: true
  ).stdout().strip(),
  meson_version : '>= 1.4.0',
)

meson.add_dist_script('utils/version.sh', 'set-dist', meson.project_version())

add_project_arguments('-D_GNU_SOURCE', language : 'c')
add_project_arguments('-DVERSION="' + meson.project_version() + '"', language : 'c')

cc = meson.get_compiler('c')

threads = dependency('threads')
libusb = dependency('libusb-1.0', required : false)

# Check for elf.h, which is needed for parsing ELF files
have_elf_h = cc.has_header('elf.h')

sources = [
  'src/ldr/helpers.c',
  'src/ldr/ldr.c',
  'src/ldr/ldr_elf.c',
  'src/ldr/lfd.c',
  'src/ldr/lfd_bf506.c',
  'src/ldr/lfd_bf518.c',
  'src/ldr/lfd_bf527.c',
  'src/ldr/lfd_bf533.c',
  'src/ldr/lfd_bf537.c',
  'src/ldr/lfd_bf548.c',
  'src/ldr/lfd_bf561.c',
  'src/ldr/lfd_bf592.c',
  'src/ldr/lfd_bf609.c',
  'src/ldr/lfd_sc589.c',
]

exe = executable('ldr',
  sources,
  dependencies : [threads, libusb],
  install : true,
)

test('Dump DXEs from example bf548.ldr', exe,
  args : ['-T', 'BF548', '--dump', join_paths(meson.project_source_root(), 'tests/data/bf548.ldr')],
  is_parallel : false)

test('Verify hash of BF548 DXEs',
  find_program('tests/verify-bf548-md5.sh'),
  workdir : meson.project_source_root(),
  is_parallel : false)
