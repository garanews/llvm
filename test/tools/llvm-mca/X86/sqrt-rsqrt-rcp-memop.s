# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=btver2 -iterations=1 -all-views=false -timeline < %s | FileCheck %s -check-prefix=ALL -check-prefix=BTVER2
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=znver1 -iterations=1 -all-views=false -timeline < %s | FileCheck %s -check-prefix=ALL -check-prefix=ZNVER1
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=haswell -iterations=1 -all-views=false -timeline < %s | FileCheck %s -check-prefix=ALL -check-prefix=HASWELL
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=broadwell -iterations=1 -all-views=false -timeline < %s | FileCheck %s -check-prefix=ALL -check-prefix=BROADWELL
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=skylake -iterations=1 -all-views=false -timeline < %s | FileCheck %s -check-prefix=ALL -check-prefix=SKYLAKE

#LLVM-MCA-BEGIN  test_sqrtss
leaq 8(%rsp, %rdi, 2), %rax
sqrtss (%rax), %xmm1
#LLVM-MCA-END

#LLVM-MCA-BEGIN  test_sqrtsd
leaq 8(%rsp, %rdi, 2), %rax
sqrtsd (%rax), %xmm1
#LLVM-MCA-END

#LLVM-MCA-BEGIN  test_rsqrtss
leaq 8(%rsp, %rdi, 2), %rax
rsqrtss (%rax), %xmm1
#LLVM-MCA-END

#LLVM-MCA-BEGIN  test_rcp
leaq 8(%rsp, %rdi, 2), %rax
rcpss (%rax), %xmm1
#LLVM-MCA-END

# ALL:            [0] Code Region - test_sqrtss

# ALL:            Timeline view:

# BROADWELL-NEXT:                     0123456789
# BROADWELL-NEXT: Index     0123456789

# BTVER2-NEXT:                        0123456789          0
# BTVER2-NEXT:    Index     0123456789          0123456789

# HASWELL-NEXT:                       0123456789
# HASWELL-NEXT:   Index     0123456789

# SKYLAKE-NEXT:                       0123456789
# SKYLAKE-NEXT:   Index     0123456789          0

# ZNVER1-NEXT:                        0123456789          0
# ZNVER1-NEXT:    Index     0123456789          0123456789

# ZNVER1:         [0,0]     DeER .    .    .    .    .    .   leaq	8(%rsp,%rdi,2), %rax
# ZNVER1-NEXT:    [0,1]     D=eeeeeeeeeeeeeeeeeeeeeeeeeeeER   sqrtss	(%rax), %xmm1

# SKYLAKE:        [0,0]     DeER .    .    .    .   leaq	8(%rsp,%rdi,2), %rax
# SKYLAKE-NEXT:   [0,1]     D=eeeeeeeeeeeeeeeeeER   sqrtss	(%rax), %xmm1

# BROADWELL:      [0,0]     DeER .    .    .   .   leaq	8(%rsp,%rdi,2), %rax
# BROADWELL-NEXT: [0,1]     D=eeeeeeeeeeeeeeeeER   sqrtss	(%rax), %xmm1

# HASWELL:        [0,0]     DeER .    .    .   .   leaq	8(%rsp,%rdi,2), %rax
# HASWELL-NEXT:   [0,1]     D=eeeeeeeeeeeeeeeeER   sqrtss	(%rax), %xmm1

# BTVER2:         [0,0]     DeeER.    .    .    .    .    .   leaq	8(%rsp,%rdi,2), %rax
# BTVER2-NEXT:    [0,1]     D==eeeeeeeeeeeeeeeeeeeeeeeeeeER   sqrtss	(%rax), %xmm1

# ALL:            Average Wait times (based on the timeline view):
# ALL-NEXT:       [0]: Executions
# ALL-NEXT:       [1]: Average time spent waiting in a scheduler's queue
# ALL-NEXT:       [2]: Average time spent waiting in a scheduler's queue while ready
# ALL-NEXT:       [3]: Average time elapsed from WB until retire stage

# ALL:                  [0]    [1]    [2]    [3]
# ALL-NEXT:       0.     1     1.0    1.0    0.0       leaq	8(%rsp,%rdi,2), %rax

# BROADWELL-NEXT: 1.     1     2.0    0.0    0.0       sqrtss	(%rax), %xmm1
# BTVER2-NEXT:    1.     1     3.0    0.0    0.0       sqrtss	(%rax), %xmm1
# HASWELL-NEXT:   1.     1     2.0    0.0    0.0       sqrtss	(%rax), %xmm1
# SKYLAKE-NEXT:   1.     1     2.0    0.0    0.0       sqrtss	(%rax), %xmm1
# ZNVER1-NEXT:    1.     1     2.0    0.0    0.0       sqrtss	(%rax), %xmm1

# ALL:            [1] Code Region - test_sqrtsd

# ALL:            Timeline view:

# BROADWELL-NEXT:                     0123456789
# BROADWELL-NEXT: Index     0123456789          01234

# BTVER2-NEXT:                        0123456789          0123456
# BTVER2-NEXT:    Index     0123456789          0123456789

# HASWELL-NEXT:                       0123456789
# HASWELL-NEXT:   Index     0123456789          01234

# SKYLAKE-NEXT:                       0123456789
# SKYLAKE-NEXT:   Index     0123456789          0123456

# ZNVER1-NEXT:                        0123456789          0
# ZNVER1-NEXT:    Index     0123456789          0123456789

# ZNVER1:         [0,0]     DeER .    .    .    .    .    .   leaq	8(%rsp,%rdi,2), %rax
# ZNVER1-NEXT:    [0,1]     D=eeeeeeeeeeeeeeeeeeeeeeeeeeeER   sqrtsd	(%rax), %xmm1

# SKYLAKE:        [0,0]     DeER .    .    .    .    ..   leaq	8(%rsp,%rdi,2), %rax
# SKYLAKE-NEXT:   [0,1]     D=eeeeeeeeeeeeeeeeeeeeeeeER   sqrtsd	(%rax), %xmm1

# BROADWELL:      [0,0]     DeER .    .    .    .   .   leaq	8(%rsp,%rdi,2), %rax
# BROADWELL-NEXT: [0,1]     D=eeeeeeeeeeeeeeeeeeeeeER   sqrtsd	(%rax), %xmm1

# HASWELL:        [0,0]     DeER .    .    .    .   .   leaq	8(%rsp,%rdi,2), %rax
# HASWELL-NEXT:   [0,1]     D=eeeeeeeeeeeeeeeeeeeeeER   sqrtsd	(%rax), %xmm1

# BTVER2:         [0,0]     DeeER.    .    .    .    .    .    ..   leaq	8(%rsp,%rdi,2), %rax
# BTVER2-NEXT:    [0,1]     D==eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeER   sqrtsd	(%rax), %xmm1

# ALL:            Average Wait times (based on the timeline view):
# ALL-NEXT:       [0]: Executions
# ALL-NEXT:       [1]: Average time spent waiting in a scheduler's queue
# ALL-NEXT:       [2]: Average time spent waiting in a scheduler's queue while ready
# ALL-NEXT:       [3]: Average time elapsed from WB until retire stage

# ALL:                  [0]    [1]    [2]    [3]
# ALL-NEXT:       0.     1     1.0    1.0    0.0       leaq	8(%rsp,%rdi,2), %rax

# BROADWELL-NEXT: 1.     1     2.0    0.0    0.0       sqrtsd	(%rax), %xmm1
# BTVER2-NEXT:    1.     1     3.0    0.0    0.0       sqrtsd	(%rax), %xmm1
# HASWELL-NEXT:   1.     1     2.0    0.0    0.0       sqrtsd	(%rax), %xmm1
# SKYLAKE-NEXT:   1.     1     2.0    0.0    0.0       sqrtsd	(%rax), %xmm1
# ZNVER1-NEXT:    1.     1     2.0    0.0    0.0       sqrtsd	(%rax), %xmm1

# ALL:            [2] Code Region - test_rsqrtss

# ALL:            Timeline view:

# BROADWELL-NEXT:                     0123
# BTVER2-NEXT:                        01
# HASWELL-NEXT:                       0123
# SKYLAKE-NEXT:                       012
# ZNVER1-NEXT:                        012345

# ALL-NEXT:       Index     0123456789

# ZNVER1:         [0,0]     DeER .    .    .   leaq	8(%rsp,%rdi,2), %rax
# ZNVER1-NEXT:    [0,1]     D=eeeeeeeeeeeeER   rsqrtss	(%rax), %xmm1

# BROADWELL:      [0,0]     DeER .    .  .   leaq	8(%rsp,%rdi,2), %rax
# BROADWELL-NEXT: [0,1]     D=eeeeeeeeeeER   rsqrtss	(%rax), %xmm1

# HASWELL:        [0,0]     DeER .    .  .   leaq	8(%rsp,%rdi,2), %rax
# HASWELL-NEXT:   [0,1]     D=eeeeeeeeeeER   rsqrtss	(%rax), %xmm1

# SKYLAKE:        [0,0]     DeER .    . .   leaq	8(%rsp,%rdi,2), %rax
# SKYLAKE-NEXT:   [0,1]     D=eeeeeeeeeER   rsqrtss	(%rax), %xmm1

# BTVER2:         [0,0]     DeeER.    ..   leaq	8(%rsp,%rdi,2), %rax
# BTVER2-NEXT:    [0,1]     D==eeeeeeeER   rsqrtss	(%rax), %xmm1

# ALL:            Average Wait times (based on the timeline view):
# ALL-NEXT:       [0]: Executions
# ALL-NEXT:       [1]: Average time spent waiting in a scheduler's queue
# ALL-NEXT:       [2]: Average time spent waiting in a scheduler's queue while ready
# ALL-NEXT:       [3]: Average time elapsed from WB until retire stage

# ALL:                  [0]    [1]    [2]    [3]
# ALL-NEXT:       0.     1     1.0    1.0    0.0       leaq	8(%rsp,%rdi,2), %rax

# BROADWELL-NEXT: 1.     1     2.0    0.0    0.0       rsqrtss	(%rax), %xmm1
# BTVER2-NEXT:    1.     1     3.0    0.0    0.0       rsqrtss	(%rax), %xmm1
# HASWELL-NEXT:   1.     1     2.0    0.0    0.0       rsqrtss	(%rax), %xmm1
# SKYLAKE-NEXT:   1.     1     2.0    0.0    0.0       rsqrtss	(%rax), %xmm1
# ZNVER1-NEXT:    1.     1     2.0    0.0    0.0       rsqrtss	(%rax), %xmm1

# ALL:            [3] Code Region - test_rcp

# ALL:            Timeline view:

# BROADWELL-NEXT:                     0123
# BTVER2-NEXT:                        01
# HASWELL-NEXT:                       0123
# SKYLAKE-NEXT:                       012
# ZNVER1-NEXT:                        012345

# ALL-NEXT:       Index     0123456789

# ZNVER1:         [0,0]     DeER .    .    .   leaq	8(%rsp,%rdi,2), %rax
# ZNVER1-NEXT:    [0,1]     D=eeeeeeeeeeeeER   rcpss	(%rax), %xmm1

# BROADWELL:      [0,0]     DeER .    .  .   leaq	8(%rsp,%rdi,2), %rax
# BROADWELL-NEXT: [0,1]     D=eeeeeeeeeeER   rcpss	(%rax), %xmm1

# HASWELL:        [0,0]     DeER .    .  .   leaq	8(%rsp,%rdi,2), %rax
# HASWELL-NEXT:   [0,1]     D=eeeeeeeeeeER   rcpss	(%rax), %xmm1

# SKYLAKE:        [0,0]     DeER .    . .   leaq	8(%rsp,%rdi,2), %rax
# SKYLAKE-NEXT:   [0,1]     D=eeeeeeeeeER   rcpss	(%rax), %xmm1

# BTVER2:         [0,0]     DeeER.    ..   leaq	8(%rsp,%rdi,2), %rax
# BTVER2-NEXT:    [0,1]     D==eeeeeeeER   rcpss	(%rax), %xmm1

# ALL:            Average Wait times (based on the timeline view):
# ALL-NEXT:       [0]: Executions
# ALL-NEXT:       [1]: Average time spent waiting in a scheduler's queue
# ALL-NEXT:       [2]: Average time spent waiting in a scheduler's queue while ready
# ALL-NEXT:       [3]: Average time elapsed from WB until retire stage

# ALL:                  [0]    [1]    [2]    [3]
# ALL-NEXT:       0.     1     1.0    1.0    0.0       leaq	8(%rsp,%rdi,2), %rax

# BROADWELL-NEXT: 1.     1     2.0    0.0    0.0       rcpss	(%rax), %xmm1
# BTVER2-NEXT:    1.     1     3.0    0.0    0.0       rcpss	(%rax), %xmm1
# HASWELL-NEXT:   1.     1     2.0    0.0    0.0       rcpss	(%rax), %xmm1
# SKYLAKE-NEXT:   1.     1     2.0    0.0    0.0       rcpss	(%rax), %xmm1
# ZNVER1-NEXT:    1.     1     2.0    0.0    0.0       rcpss	(%rax), %xmm1
