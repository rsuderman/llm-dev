module @module {
  util.global private @__auto.constant_6144_torch.float32 = dense_resource<__auto.constant_6144_torch.float32> : tensor<6144xf32>
  util.global private @__auto.constant_8_6144_torch.float32 = dense_resource<__auto.constant_8_6144_torch.float32> : tensor<8x6144xf32>
  util.global private @__auto.constant_8_8192_6144_torch.float32 = dense_resource<__auto.constant_8_8192_6144_torch.float32> : tensor<8x8192x6144xf32>
  util.global private @__auto.constant_8_8192_6144_torch.float32$1 = dense_resource<__auto.constant_8_8192_6144_torch.float32$1> : tensor<8x8192x6144xf32>
  util.global private @__auto.constant_8_6144_8192_torch.float32 = dense_resource<__auto.constant_8_6144_8192_torch.float32> : tensor<8x6144x8192xf32>
  util.func public @prefill_grok$async(%arg0: !hal.buffer_view, %arg1: !hal.fence, %arg2: !hal.fence) -> !hal.buffer_view attributes {inlining_policy = #util.inline.never, iree.abi.model = "coarse-fences", iree.abi.stub} {
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0xFF800000 : f32
    %c8_i64 = arith.constant 8 : i64
    %cst_1 = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 9.99999974E-6 : f32
    %cst_3 = arith.constant 2.000000e+00 : f32
    %cst_4 = arith.constant 6.144000e+03 : f32
    %0 = hal.tensor.import wait(%arg1) => %arg0 : !hal.buffer_view -> tensor<2x32x6144xf32>
    %__auto.constant_6144_torch.float32 = util.global.load @__auto.constant_6144_torch.float32 : tensor<6144xf32>
    %__auto.constant_8_6144_torch.float32 = util.global.load @__auto.constant_8_6144_torch.float32 : tensor<8x6144xf32>
    %__auto.constant_8_8192_6144_torch.float32 = util.global.load @__auto.constant_8_8192_6144_torch.float32 : tensor<8x8192x6144xf32>
    %__auto.constant_8_8192_6144_torch.float32$1 = util.global.load @__auto.constant_8_8192_6144_torch.float32$1 : tensor<8x8192x6144xf32>
    %__auto.constant_8_6144_8192_torch.float32 = util.global.load @__auto.constant_8_6144_8192_torch.float32 : tensor<8x6144x8192xf32>
    %1 = tensor.empty() : tensor<2x32x6144xf32>
    %2 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%0 : tensor<2x32x6144xf32>) outs(%1 : tensor<2x32x6144xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = math.powf %in, %cst_3 : f32
      linalg.yield %73 : f32
    } -> tensor<2x32x6144xf32>
    %3 = tensor.empty() : tensor<2x32x1xf32>
    %4 = linalg.fill ins(%cst : f32) outs(%3 : tensor<2x32x1xf32>) -> tensor<2x32x1xf32>
    %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, 0)>], iterator_types = ["parallel", "parallel", "reduction"]} ins(%2 : tensor<2x32x6144xf32>) outs(%4 : tensor<2x32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = arith.addf %in, %out : f32
      linalg.yield %73 : f32
    } -> tensor<2x32x1xf32>
    %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, 0)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%5 : tensor<2x32x1xf32>) outs(%3 : tensor<2x32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = arith.divf %in, %cst_4 : f32
      linalg.yield %73 : f32
    } -> tensor<2x32x1xf32>
    %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, 0)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%6 : tensor<2x32x1xf32>) outs(%3 : tensor<2x32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = arith.addf %in, %cst_2 : f32
      linalg.yield %73 : f32
    } -> tensor<2x32x1xf32>
    %8 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, 0)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%7 : tensor<2x32x1xf32>) outs(%3 : tensor<2x32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = math.rsqrt %in : f32
      linalg.yield %73 : f32
    } -> tensor<2x32x1xf32>
    %9 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, 0)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%0, %8 : tensor<2x32x6144xf32>, tensor<2x32x1xf32>) outs(%1 : tensor<2x32x6144xf32>) {
    ^bb0(%in: f32, %in_23: f32, %out: f32):
      %73 = arith.mulf %in, %in_23 : f32
      linalg.yield %73 : f32
    } -> tensor<2x32x6144xf32>
    %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%9, %__auto.constant_6144_torch.float32 : tensor<2x32x6144xf32>, tensor<6144xf32>) outs(%1 : tensor<2x32x6144xf32>) {
    ^bb0(%in: f32, %in_23: f32, %out: f32):
      %73 = arith.mulf %in, %in_23 : f32
      linalg.yield %73 : f32
    } -> tensor<2x32x6144xf32>
    %collapsed = tensor.collapse_shape %10 [[0, 1], [2]] : tensor<2x32x6144xf32> into tensor<64x6144xf32>
    %11 = tensor.empty() : tensor<6144x8xf32>
    %12 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%__auto.constant_8_6144_torch.float32 : tensor<8x6144xf32>) outs(%11 : tensor<6144x8xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<6144x8xf32>
    %13 = tensor.empty() : tensor<64x8xf32>
    %14 = linalg.fill ins(%cst : f32) outs(%13 : tensor<64x8xf32>) -> tensor<64x8xf32>
    %15 = linalg.matmul ins(%collapsed, %12 : tensor<64x6144xf32>, tensor<6144x8xf32>) outs(%14 : tensor<64x8xf32>) -> tensor<64x8xf32>
    %16 = tensor.empty() : tensor<64xi64>
    %17 = linalg.fill ins(%c0_i64 : i64) outs(%16 : tensor<64xi64>) -> tensor<64xi64>
    %18 = tensor.empty() : tensor<64xf32>
    %19 = linalg.fill ins(%cst_0 : f32) outs(%18 : tensor<64xf32>) -> tensor<64xf32>
    %20:2 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%15 : tensor<64x8xf32>) outs(%19, %17 : tensor<64xf32>, tensor<64xi64>) {
    ^bb0(%in: f32, %out: f32, %out_23: i64):
      %73 = linalg.index 1 : index
      %74 = arith.index_cast %73 : index to i64
      %75 = arith.maximumf %in, %out : f32
      %76 = arith.cmpf ogt, %in, %out : f32
      %77 = arith.select %76, %74, %out_23 : i64
      linalg.yield %75, %77 : f32, i64
    } -> (tensor<64xf32>, tensor<64xi64>)
    %expanded = tensor.expand_shape %20#0 [[0, 1]] output_shape [64, 1] : tensor<64xf32> into tensor<64x1xf32>
    %21 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, 0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%15, %expanded : tensor<64x8xf32>, tensor<64x1xf32>) outs(%13 : tensor<64x8xf32>) {
    ^bb0(%in: f32, %in_23: f32, %out: f32):
      %73 = arith.subf %in, %in_23 : f32
      linalg.yield %73 : f32
    } -> tensor<64x8xf32>
    %22 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%21 : tensor<64x8xf32>) outs(%13 : tensor<64x8xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = math.exp %in : f32
      linalg.yield %73 : f32
    } -> tensor<64x8xf32>
    %23 = tensor.empty() : tensor<64x1xf32>
    %24 = linalg.fill ins(%cst : f32) outs(%23 : tensor<64x1xf32>) -> tensor<64x1xf32>
    %25 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, 0)>], iterator_types = ["parallel", "reduction"]} ins(%22 : tensor<64x8xf32>) outs(%24 : tensor<64x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = arith.addf %in, %out : f32
      linalg.yield %73 : f32
    } -> tensor<64x1xf32>
    %26 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, 0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%22, %25 : tensor<64x8xf32>, tensor<64x1xf32>) outs(%13 : tensor<64x8xf32>) {
    ^bb0(%in: f32, %in_23: f32, %out: f32):
      %73 = arith.divf %in, %in_23 : f32
      linalg.yield %73 : f32
    } -> tensor<64x8xf32>
    %27 = tensor.empty() : tensor<64x8xi64>
    %28 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} outs(%27 : tensor<64x8xi64>) {
    ^bb0(%out: i64):
      %73 = linalg.index 1 : index
      %74 = arith.index_cast %73 : index to i64
      linalg.yield %74 : i64
    } -> tensor<64x8xi64>
    %29:2 = iree_linalg_ext.sort dimension(1) outs(%26, %28 : tensor<64x8xf32>, tensor<64x8xi64>) {
    ^bb0(%arg3: f32, %arg4: f32, %arg5: i64, %arg6: i64):
      %73 = arith.cmpf oge, %arg3, %arg4 : f32
      iree_linalg_ext.yield %73 : i1
    } -> tensor<64x8xf32>, tensor<64x8xi64>
    %extracted_slice = tensor.extract_slice %29#0[0, 0] [64, 2] [1, 1] : tensor<64x8xf32> to tensor<64x2xf32>
    %extracted_slice_5 = tensor.extract_slice %29#1[0, 0] [64, 2] [1, 1] : tensor<64x8xi64> to tensor<64x2xi64>
    %30 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, 0)>], iterator_types = ["parallel", "reduction"]} ins(%extracted_slice : tensor<64x2xf32>) outs(%24 : tensor<64x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = arith.addf %in, %out : f32
      linalg.yield %73 : f32
    } -> tensor<64x1xf32>
    %31 = tensor.empty() : tensor<64x2xf32>
    %32 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, 0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%extracted_slice, %30 : tensor<64x2xf32>, tensor<64x1xf32>) outs(%31 : tensor<64x2xf32>) {
    ^bb0(%in: f32, %in_23: f32, %out: f32):
      %73 = arith.divf %in, %in_23 : f32
      linalg.yield %73 : f32
    } -> tensor<64x2xf32>
    %33 = tensor.empty() : tensor<64x2x8192x6144xf32>
    %34 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%extracted_slice_5 : tensor<64x2xi64>) outs(%33 : tensor<64x2x8192x6144xf32>) {
    ^bb0(%in: i64, %out: f32):
      %73 = arith.cmpi slt, %in, %c0_i64 : i64
      %74 = arith.addi %in, %c8_i64 : i64
      %75 = arith.select %73, %74, %in : i64
      %76 = arith.index_cast %75 : i64 to index
      %77 = linalg.index 2 : index
      %78 = linalg.index 3 : index
      %extracted = tensor.extract %__auto.constant_8_8192_6144_torch.float32[%76, %77, %78] : tensor<8x8192x6144xf32>
      linalg.yield %extracted : f32
    } -> tensor<64x2x8192x6144xf32>
    %expanded_6 = tensor.expand_shape %collapsed [[0], [1, 2, 3]] output_shape [64, 6144, 1, 1] : tensor<64x6144xf32> into tensor<64x6144x1x1xf32>
    %35 = tensor.empty() : tensor<64x1x1x6144xf32>
    %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_6 : tensor<64x6144x1x1xf32>) outs(%35 : tensor<64x1x1x6144xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x1x1x6144xf32>
    %37 = tensor.empty() : tensor<64x6144x1x1xf32>
    %38 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%36 : tensor<64x1x1x6144xf32>) outs(%37 : tensor<64x6144x1x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x6144x1x1xf32>
    %collapsed_7 = tensor.collapse_shape %38 [[0], [1, 2, 3]] : tensor<64x6144x1x1xf32> into tensor<64x6144xf32>
    %expanded_8 = tensor.expand_shape %collapsed_7 [[0], [1, 2]] output_shape [64, 1, 6144] : tensor<64x6144xf32> into tensor<64x1x6144xf32>
    %39 = tensor.empty() : tensor<64x6144x2x8192xf32>
    %40 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%34 : tensor<64x2x8192x6144xf32>) outs(%39 : tensor<64x6144x2x8192xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x6144x2x8192xf32>
    %collapsed_9 = tensor.collapse_shape %40 [[0], [1], [2, 3]] : tensor<64x6144x2x8192xf32> into tensor<64x6144x16384xf32>
    %41 = tensor.empty() : tensor<64x1x16384xf32>
    %42 = linalg.fill ins(%cst : f32) outs(%41 : tensor<64x1x16384xf32>) -> tensor<64x1x16384xf32>
    %43 = linalg.batch_matmul ins(%expanded_8, %collapsed_9 : tensor<64x1x6144xf32>, tensor<64x6144x16384xf32>) outs(%42 : tensor<64x1x16384xf32>) -> tensor<64x1x16384xf32>
    %expanded_10 = tensor.expand_shape %43 [[0], [1], [2, 3]] output_shape [64, 1, 2, 8192] : tensor<64x1x16384xf32> into tensor<64x1x2x8192xf32>
    %44 = tensor.empty() : tensor<64x2x8192x1xf32>
    %45 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_10 : tensor<64x1x2x8192xf32>) outs(%44 : tensor<64x2x8192x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x2x8192x1xf32>
    %collapsed_11 = tensor.collapse_shape %45 [[0], [1], [2, 3]] : tensor<64x2x8192x1xf32> into tensor<64x2x8192xf32>
    %46 = tensor.empty() : tensor<64x2x8192xf32>
    %47 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_11 : tensor<64x2x8192xf32>) outs(%46 : tensor<64x2x8192xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = arith.negf %in : f32
      %74 = math.exp %73 : f32
      %75 = arith.addf %74, %cst_1 : f32
      %76 = arith.divf %cst_1, %75 : f32
      linalg.yield %76 : f32
    } -> tensor<64x2x8192xf32>
    %48 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%47, %collapsed_11 : tensor<64x2x8192xf32>, tensor<64x2x8192xf32>) outs(%46 : tensor<64x2x8192xf32>) {
    ^bb0(%in: f32, %in_23: f32, %out: f32):
      %73 = arith.mulf %in, %in_23 : f32
      linalg.yield %73 : f32
    } -> tensor<64x2x8192xf32>
    %49 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%extracted_slice_5 : tensor<64x2xi64>) outs(%33 : tensor<64x2x8192x6144xf32>) {
    ^bb0(%in: i64, %out: f32):
      %73 = arith.cmpi slt, %in, %c0_i64 : i64
      %74 = arith.addi %in, %c8_i64 : i64
      %75 = arith.select %73, %74, %in : i64
      %76 = arith.index_cast %75 : i64 to index
      %77 = linalg.index 2 : index
      %78 = linalg.index 3 : index
      %extracted = tensor.extract %__auto.constant_8_8192_6144_torch.float32$1[%76, %77, %78] : tensor<8x8192x6144xf32>
      linalg.yield %extracted : f32
    } -> tensor<64x2x8192x6144xf32>
    %50 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%49 : tensor<64x2x8192x6144xf32>) outs(%39 : tensor<64x6144x2x8192xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x6144x2x8192xf32>
    %collapsed_12 = tensor.collapse_shape %50 [[0], [1], [2, 3]] : tensor<64x6144x2x8192xf32> into tensor<64x6144x16384xf32>
    %51 = linalg.batch_matmul ins(%expanded_8, %collapsed_12 : tensor<64x1x6144xf32>, tensor<64x6144x16384xf32>) outs(%42 : tensor<64x1x16384xf32>) -> tensor<64x1x16384xf32>
    %expanded_13 = tensor.expand_shape %51 [[0], [1], [2, 3]] output_shape [64, 1, 2, 8192] : tensor<64x1x16384xf32> into tensor<64x1x2x8192xf32>
    %52 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_13 : tensor<64x1x2x8192xf32>) outs(%44 : tensor<64x2x8192x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x2x8192x1xf32>
    %collapsed_14 = tensor.collapse_shape %52 [[0], [1], [2, 3]] : tensor<64x2x8192x1xf32> into tensor<64x2x8192xf32>
    %53 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%48, %collapsed_14 : tensor<64x2x8192xf32>, tensor<64x2x8192xf32>) outs(%46 : tensor<64x2x8192xf32>) {
    ^bb0(%in: f32, %in_23: f32, %out: f32):
      %73 = arith.mulf %in, %in_23 : f32
      linalg.yield %73 : f32
    } -> tensor<64x2x8192xf32>
    %54 = tensor.empty() : tensor<64x2x6144x8192xf32>
    %55 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%extracted_slice_5 : tensor<64x2xi64>) outs(%54 : tensor<64x2x6144x8192xf32>) {
    ^bb0(%in: i64, %out: f32):
      %73 = arith.cmpi slt, %in, %c0_i64 : i64
      %74 = arith.addi %in, %c8_i64 : i64
      %75 = arith.select %73, %74, %in : i64
      %76 = arith.index_cast %75 : i64 to index
      %77 = linalg.index 2 : index
      %78 = linalg.index 3 : index
      %extracted = tensor.extract %__auto.constant_8_6144_8192_torch.float32[%76, %77, %78] : tensor<8x6144x8192xf32>
      linalg.yield %extracted : f32
    } -> tensor<64x2x6144x8192xf32>
    %expanded_15 = tensor.expand_shape %53 [[0], [1], [2, 3]] output_shape [64, 2, 8192, 1] : tensor<64x2x8192xf32> into tensor<64x2x8192x1xf32>
    %56 = tensor.empty() : tensor<64x2x1x8192xf32>
    %57 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d3, d2)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_15 : tensor<64x2x8192x1xf32>) outs(%56 : tensor<64x2x1x8192xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x2x1x8192xf32>
    %58 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d3, d2)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%57 : tensor<64x2x1x8192xf32>) outs(%44 : tensor<64x2x8192x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x2x8192x1xf32>
    %collapsed_16 = tensor.collapse_shape %58 [[0, 1], [2, 3]] : tensor<64x2x8192x1xf32> into tensor<128x8192xf32>
    %expanded_17 = tensor.expand_shape %collapsed_16 [[0], [1, 2]] output_shape [128, 1, 8192] : tensor<128x8192xf32> into tensor<128x1x8192xf32>
    %59 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d3, d2)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%55 : tensor<64x2x6144x8192xf32>) outs(%33 : tensor<64x2x8192x6144xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x2x8192x6144xf32>
    %collapsed_18 = tensor.collapse_shape %59 [[0, 1], [2], [3]] : tensor<64x2x8192x6144xf32> into tensor<128x8192x6144xf32>
    %60 = tensor.empty() : tensor<128x1x6144xf32>
    %61 = linalg.fill ins(%cst : f32) outs(%60 : tensor<128x1x6144xf32>) -> tensor<128x1x6144xf32>
    %62 = linalg.batch_matmul ins(%expanded_17, %collapsed_18 : tensor<128x1x8192xf32>, tensor<128x8192x6144xf32>) outs(%61 : tensor<128x1x6144xf32>) -> tensor<128x1x6144xf32>
    %expanded_19 = tensor.expand_shape %62 [[0, 1], [2], [3]] output_shape [64, 2, 1, 6144] : tensor<128x1x6144xf32> into tensor<64x2x1x6144xf32>
    %63 = tensor.empty() : tensor<64x2x6144x1xf32>
    %64 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d3, d2)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_19 : tensor<64x2x1x6144xf32>) outs(%63 : tensor<64x2x6144x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x2x6144x1xf32>
    %collapsed_20 = tensor.collapse_shape %64 [[0], [1], [2, 3]] : tensor<64x2x6144x1xf32> into tensor<64x2x6144xf32>
    %expanded_21 = tensor.expand_shape %32 [[0], [1, 2]] output_shape [64, 2, 1] : tensor<64x2xf32> into tensor<64x2x1xf32>
    %65 = tensor.empty() : tensor<64x2x6144xf32>
    %66 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, 0)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_21, %collapsed_20 : tensor<64x2x1xf32>, tensor<64x2x6144xf32>) outs(%65 : tensor<64x2x6144xf32>) {
    ^bb0(%in: f32, %in_23: f32, %out: f32):
      %73 = arith.mulf %in, %in_23 : f32
      linalg.yield %73 : f32
    } -> tensor<64x2x6144xf32>
    %67 = tensor.empty() : tensor<64x6144xf32>
    %68 = linalg.fill ins(%cst : f32) outs(%67 : tensor<64x6144xf32>) -> tensor<64x6144xf32>
    %69 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d2)>], iterator_types = ["parallel", "reduction", "parallel"]} ins(%66 : tensor<64x2x6144xf32>) outs(%68 : tensor<64x6144xf32>) {
    ^bb0(%in: f32, %out: f32):
      %73 = arith.addf %in, %out : f32
      linalg.yield %73 : f32
    } -> tensor<64x6144xf32>
    %expanded_22 = tensor.expand_shape %69 [[0, 1], [2]] output_shape [2, 32, 6144] : tensor<64x6144xf32> into tensor<2x32x6144xf32>
    %70 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%0, %expanded_22 : tensor<2x32x6144xf32>, tensor<2x32x6144xf32>) outs(%1 : tensor<2x32x6144xf32>) {
    ^bb0(%in: f32, %in_23: f32, %out: f32):
      %73 = arith.addf %in, %in_23 : f32
      linalg.yield %73 : f32
    } -> tensor<2x32x6144xf32>
    %71 = hal.tensor.barrier join(%70 : tensor<2x32x6144xf32>) => %arg2 : !hal.fence
    %72 = hal.tensor.export %71 : tensor<2x32x6144xf32> -> !hal.buffer_view
    util.return %72 : !hal.buffer_view
  }
  util.func public @prefill_grok(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub} {
    %0 = util.null : !hal.fence
    %c-1_i32 = arith.constant -1 : i32
    %c0 = arith.constant 0 : index
    %device_0 = hal.devices.get %c0 : !hal.device
    %fence = hal.fence.create device(%device_0 : !hal.device) flags("None") : !hal.fence
    %1 = util.call @prefill_grok$async(%arg0, %0, %fence) : (!hal.buffer_view, !hal.fence, !hal.fence) -> !hal.buffer_view
    %status = hal.fence.await until([%fence]) timeout_millis(%c-1_i32) : i32
    util.return %1 : !hal.buffer_view
  }
}