// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:logiw/data/services/api/model/user/user_api_model.dart';
import 'package:logiw/domain/models/user/user.dart';

const userApiModel = UserApiModel(
  id: 'ID',
  mst: 'NAME',
  tencty: 'EMAIL',
  picture: 'assets/user.jpg',
);

const user = User(id: 'ID', mst: 'NAME', picture: 'assets/user.jpg');
